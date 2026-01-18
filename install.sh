  #!/bin/bash

  set -e

  error() {
    echo "$1" >&2
    exit 1
  }


  VERSION="$(jq -r '.version' info.json)"
  ARCHIVE_FILENAME="build-utils_$VERSION.zip"
  REPO_NAME=$(basename "$(pwd)")
  rm -rf build-utils_*.zip
  cd ..
  zip -r "$ARCHIVE_FILENAME" "$REPO_NAME" -x '**/.*' -x '**/*.sh' -x '**/*.zip'
  mv "$ARCHIVE_FILENAME" "$REPO_NAME/"
  cd "$REPO_NAME"
  echo "zipped to $ARCHIVE_FILENAME!"

  if [ -f .env ] && command -v source >/dev/null; then
    source .env
  fi

  if [ -z "$FACTORIO_PATH" ]; then
    error "FACTORIO_PATH is not set. Please provide the path to your Factorio installation in the FACTORIO_PATH environment variable for automatic installation."
  fi

  if [ ! -d "$FACTORIO_PATH" ]; then
    error "FACTORIO_PATH directory does not exist: $FACTORIO_PATH"
  fi

  OUTPUT_PATH="$FACTORIO_PATH/mods/"
  echo "moving $ARCHIVE_FILENAME to $OUTPUT_PATH ..."
  mv "$ARCHIVE_FILENAME" "$OUTPUT_PATH"
  echo "done!"
