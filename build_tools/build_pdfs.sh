#!/usr/bin/env bash
# Build PDF tutorials from Flat ODT (.fodt) sources using LibreOffice.
#
# Usage:
#   ./build_tools/build_pdfs.sh                 # all tracked *.fodt files
#   ./build_tools/build_pdfs.sh path/to/a.fodt  # specific file(s)
#   ./build_tools/build_pdfs.sh --root          # root-level *.fodt only
#
# CI entry point: .github/workflows/fodt-to-pdf.yml
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONVERT="$ROOT_DIR/build_tools/convert_fodt_to_pdf.sh"

cd "$ROOT_DIR"
chmod +x "$CONVERT"

if [[ "${1:-}" == "--root" ]]; then
  shift
  shopt -s nullglob
  files=(./*.fodt)
  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No root-level .fodt files found"
    exit 0
  fi
  echo "Converting ${#files[@]} root-level FODT file(s) to PDF"
  "$CONVERT" "${files[@]}"
elif [[ $# -gt 0 ]]; then
  echo "Converting $# FODT file(s) to PDF"
  "$CONVERT" "$@"
else
  echo "Converting all tracked FODT files to PDF"
  "$CONVERT"
fi
