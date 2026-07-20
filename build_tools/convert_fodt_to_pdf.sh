#!/usr/bin/env bash
# Convert one or more Flat ODT (.fodt) tutorials to PDF with LibreOffice.
# Usage:
#   convert_fodt_to_pdf.sh path/to/file.fodt [...]
#   convert_fodt_to_pdf.sh                 # convert all tracked *.fodt files
set -euo pipefail

if ! command -v soffice >/dev/null 2>&1 && ! command -v libreoffice >/dev/null 2>&1; then
  echo "error: LibreOffice (soffice) is not installed" >&2
  exit 1
fi

SOFFICE=(soffice)
if ! command -v soffice >/dev/null 2>&1; then
  SOFFICE=(libreoffice)
fi

convert_one() {
  local fodt="$1"
  if [[ ! -f "$fodt" ]]; then
    echo "warning: skipping missing file: $fodt" >&2
    return 0
  fi
  if [[ "$fodt" != *.fodt ]]; then
    echo "warning: skipping non-.fodt file: $fodt" >&2
    return 0
  fi

  local dir
  dir="$(dirname "$fodt")"
  echo "Converting $fodt -> ${dir}/$(basename "${fodt%.fodt}.pdf")"
  "${SOFFICE[@]}" --headless --nologo --nofirststartwizard --norestore \
    --convert-to pdf --outdir "$dir" "$fodt"
}

if [[ $# -eq 0 ]]; then
  mapfile -t files < <(git ls-files '*.fodt' 2>/dev/null || ls -1 ./*.fodt 2>/dev/null || true)
  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No .fodt files to convert"
    exit 0
  fi
  for fodt in "${files[@]}"; do
    convert_one "$fodt"
  done
else
  for fodt in "$@"; do
    convert_one "$fodt"
  done
fi
