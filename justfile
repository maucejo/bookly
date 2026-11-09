# Publish the documentation to GitHub Pages.
# Usage :
#   just publish-gh
#   just publish-gh docs main       # custom source, custom branch
publish-gh source="docs/_site" branch="gh-pages":
    SOURCE={{source}} BRANCH={{branch}} ./scripts/publish-docs.sh

# Run the test suite (tytanic).
# Usage :
#   just test
test:
    tt run --no-fail-fast --warnings ignore

# Add a new test to the test suite (tytanic).
# Usage :
#   just add-test name="test"
add-test name="test":
    tt new {{name}} --compile-only

