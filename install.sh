#!/usr/bin/env bash
#
# install progfun-templ and progfun-test into ~/.local/bin

set -euo pipefail

SCRIPTS=(progfun-templ progfun-test)
SRC_DIR="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="$HOME/.local/bin"

mkdir -p "$DEST_DIR"

for script in "${SCRIPTS[@]}"; do
    if [[ ! -f "$SRC_DIR/$script" ]]; then
        echo "install.sh: missing $script in $SRC_DIR" >&2
        exit 1
    fi
    cp -- "$SRC_DIR/$script" "$DEST_DIR/$script"
    sed -i 's/\r$//' "$DEST_DIR/$script"
    chmod 755 "$DEST_DIR/$script"
    echo "installed $script"
done

if ! command -v "${SCRIPTS[0]}" >/dev/null 2>&1; then
    echo
    echo "$DEST_DIR not in PATH"
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
    echo "  source ~/.bashrc"
fi

command -v gcc >/dev/null 2>&1 || echo "gcc is not installed"