#!/usr/bin/env bash
#
# Using HTML-proofer to test site.
#
# Requirement: https://github.com/gjtorikian/html-proofer
#
# Usage: bash /path/to/test.sh [indicated path]

DEST=_site
URL_IGNORE=cdn.jsdelivr.net

_build=false

help() {
  echo "Usage:"
  echo
  echo "   bash ./tools/test.sh [options]"
  echo
  echo "Options:"
  echo "     --build                  Run Jekyll build before test."
  echo "     -d, --dir   <path>       Specify the test path."
  echo "     -h, --help               Print this information."
}

if [[ -n $1 && -d $1 ]]; then
  DEST=$1
fi


  exit 0

done

if $_build; then
  JEKYLL_ENV=production bundle exec jekyll b
fi

bundle exec htmlproofer "$DEST" \
  --disable-external \
  --check-html \
  --empty_alt_ignore \
  --allow_hash_href \
  --url_ignore $URL_IGNORE
