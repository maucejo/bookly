#!/usr/bin/env bash
#
# publish-docs.sh — Publie la documentation vers la branche gh-pages du dépôt.
#
# Fonctionnement :
#   - crée (ou réutilise) un git worktree séparé pointant sur la branche gh-pages,
#     sans jamais changer de branche dans le clone courant ;
#   - synchronise le contenu de SOURCE vers la racine de ce worktree ;
#   - commit et pousse si des changements sont détectés.
#
# Prérequis : git >= 2.5 (worktree), rsync.
#
# Usage :
#   ./publish-docs.sh
#   SOURCE=docs BRANCH=gh-pages REMOTE=origin ./publish-docs.sh

set -euo pipefail

# --- Configuration (surchargeable via variables d'environnement) ----------

REMOTE="${REMOTE:-origin}"
BRANCH="${BRANCH:-gh-pages}"
# Dossier ou fichier source à publier. Par défaut : le README à la racine.
SOURCE="${SOURCE:-docs}"
WORKTREE_DIR="${WORKTREE_DIR:-.gh-pages-worktree}"
COMMIT_MESSAGE="${COMMIT_MESSAGE:-docs: mise à jour de la documentation ($(date -u +%Y-%m-%dT%H:%M:%SZ))}"

# --- Vérifications préalables ----------------------------------------------

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Erreur : ce script doit être exécuté depuis un dépôt git." >&2
  exit 1
fi

if [ ! -e "$SOURCE" ]; then
  echo "Erreur : la source '$SOURCE' est introuvable." >&2
  exit 1
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

# Supprime proprement le worktree temporaire à la fin du script.
cleanup_worktree() {
  cd "$REPO_ROOT" 2>/dev/null || true
  if [ -d "$WORKTREE_DIR" ]; then
    git worktree remove --force "$WORKTREE_DIR" > /dev/null 2>&1 || true
  fi
}
trap cleanup_worktree EXIT

git fetch "$REMOTE" "$BRANCH" > /dev/null 2>&1 || true

# --- Préparation du worktree gh-pages --------------------------------------
# Nettoie les éventuelles références vers des worktrees supprimés manuellement.
git worktree prune

if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
  # La branche existe déjà localement : on l'attache dans le worktree.
  if [ ! -d "$WORKTREE_DIR" ]; then
    git worktree add "$WORKTREE_DIR" "$BRANCH"
  fi
elif git show-ref --verify --quiet "refs/remotes/$REMOTE/$BRANCH"; then
  # La branche existe côté distant mais pas localement.
  git worktree add -B "$BRANCH" "$WORKTREE_DIR" "$REMOTE/$BRANCH"
else
  # Aucune branche gh-pages : on en crée une, orpheline (historique indépendant).
  git worktree add --detach "$WORKTREE_DIR"
  (
    cd "$WORKTREE_DIR"
    git checkout --orphan "$BRANCH"
    git rm -rf . > /dev/null 2>&1 || true
  )
fi

# --- Synchronisation du contenu --------------------------------------------

if [ -d "$SOURCE" ]; then
  # Cas dossier : on synchronise le contenu, en préservant le .git du worktree.
  rsync -a --delete --exclude='.git' --exclude='*.typ' "$SOURCE"/ "$WORKTREE_DIR"/
else
  # Cas fichier unique (ex. README.md) : publié comme index.md pour que
  # GitHub Pages (Jekyll) le rende automatiquement en page d'accueil.
  find "$WORKTREE_DIR" -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
  cp "$SOURCE" "$WORKTREE_DIR/index.md"
fi

# --- Commit et publication --------------------------------------------------

cd "$WORKTREE_DIR"

git add -A

if git diff --cached --quiet; then
  echo "Rien à publier : la documentation est déjà à jour sur $BRANCH."
  exit 0
fi

git commit -m "$COMMIT_MESSAGE"
git push "$REMOTE" "$BRANCH"

echo "Documentation publiée sur la branche $BRANCH."