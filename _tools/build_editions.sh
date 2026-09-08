#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CURRENT_YEAR="${CURRENT_YEAR:-2026}"
SITE_BASE="${SITE_BASE:-/bandit}"
OUTPUT_DIR="${OUTPUT_DIR:-_site}"
LOCAL_PREFIX="${LOCAL_PREFIX:-bandit}"
BUILD_DIR="${BUILD_DIR:-.jekyll-build}"

DEST_ROOT="$ROOT_DIR/$OUTPUT_DIR"
if [[ -n "$LOCAL_PREFIX" ]]; then
  DEST_BASE="$DEST_ROOT/$LOCAL_PREFIX"
else
  DEST_BASE="$DEST_ROOT"
fi

rm -rf "$ROOT_DIR/$BUILD_DIR" "$DEST_ROOT"
mkdir -p "$ROOT_DIR/$BUILD_DIR" "$DEST_BASE"

copy_shared() {
  local year="$1"
  local tmp="$ROOT_DIR/$BUILD_DIR/$year"
  mkdir -p "$tmp"

  cp "$ROOT_DIR/_config.yml" "$tmp/_config.yml"
  cp "$ROOT_DIR/Gemfile" "$tmp/Gemfile"
  cp "$ROOT_DIR/Gemfile.lock" "$tmp/Gemfile.lock"

  for path in _layouts _includes _sass assets; do
    if [[ -e "$ROOT_DIR/$path" ]]; then
      cp -a "$ROOT_DIR/$path" "$tmp/$path"
    fi
  done

  cp -a "$ROOT_DIR/_editions/$year/." "$tmp/"
  mv "$tmp/_config.yml" "$tmp/_config.edition.yml"
  cp "$ROOT_DIR/_config.yml" "$tmp/_config.yml"
}

for edition_dir in "$ROOT_DIR"/_editions/*; do
  [[ -d "$edition_dir" ]] || continue
  year="$(basename "$edition_dir")"
  echo "==> Preparing BANDIT $year"
  copy_shared "$year"
  echo "==> Building BANDIT $year"
  bundle exec jekyll build \
    --source "$ROOT_DIR/$BUILD_DIR/$year" \
    --destination "$DEST_BASE/$year" \
    --config "$ROOT_DIR/$BUILD_DIR/$year/_config.yml,$ROOT_DIR/$BUILD_DIR/$year/_config.edition.yml"
  rm -f "$DEST_BASE/$year/Gemfile" "$DEST_BASE/$year/Gemfile.lock"
done

cat > "$DEST_BASE/index.html" <<EOF_REDIRECT
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="0; url=$SITE_BASE/$CURRENT_YEAR/">
    <link rel="canonical" href="$SITE_BASE/$CURRENT_YEAR/">
    <title>BANDIT</title>
  </head>
  <body>
    <p>Redirecting to <a href="$SITE_BASE/$CURRENT_YEAR/">BANDIT $CURRENT_YEAR</a>.</p>
  </body>
</html>
EOF_REDIRECT

echo "==> Built editions under $DEST_BASE"
