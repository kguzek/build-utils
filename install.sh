  #!/bin/bash

  set -e

  error() {
    echo "$1" >&2
    exit 1
  }

  TEMPORARY_FILENAME='build-utils.zip'

  REPO_NAME=$(basename "$(pwd)")
  cd ..
  zip -r "$TEMPORARY_FILENAME" "$REPO_NAME" -x '**/.git/*' -x '**/.gitignore' -x '**/*.sh' -x '**/.env*'
  echo "zipped to $TEMPORARY_FILENAME!"
  cd "$REPO_NAME"

  if [ -f .env ] && command -v source >/dev/null; then
    source .env
  fi

  if [ -z "$FACTORIO_PATH" ]; then
    error "FACTORIO_PATH is not set. Please provide the path to your Factorio installation in the FACTORIO_PATH environment variable for automatic installation."
  fi

  if [ ! -d "$FACTORIO_PATH" ]; then
    error "FACTORIO_PATH directory does not exist: $FACTORIO_PATH"
  fi

  VERSION="$(jq -r '.version' info.json)"
  OUTPUT_PATH="$FACTORIO_PATH/mods/build-utils_$VERSION.zip"
  echo "moving $TEMPORARY_FILENAME to $OUTPUT_PATH ..."
  mv "../$TEMPORARY_FILENAME" "$OUTPUT_PATH"
  echo "done!"
