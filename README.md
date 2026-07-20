# tutorials
This repository is where contributed tutorials for SasView live!

`.fodt` files committed here are automatically converted to PDF by GitHub
Actions (`.github/workflows/fodt-to-pdf.yml`) using LibreOffice.

- On **pull requests**: changed `.fodt` files are converted and the PDFs are
  uploaded as workflow artifacts (nothing is committed back to the PR branch).
- On **push** to a branch: PDFs are generated, uploaded as artifacts, and
  committed back to the same branch.
- **workflow_dispatch** can rebuild all (or recently changed) tutorials manually.

To convert locally (requires LibreOffice):

```bash
./build_tools/build_pdfs.sh                  # all tracked .fodt files
./build_tools/build_pdfs.sh path/to/file.fodt
./build_tools/build_pdfs.sh --root           # root-level .fodt only
```

Once any new/changed tutorials are ready for general consumption the
following steps should be taken:

- All the pdf files should be copied to the /downloads folder of the
  website repository sasview.github.io.  This is effectively the
  release step for the tutorials, making them available from
  http://www.sasview.org/links.html

  - For consistency, and to avoid rendering issues, prefer the PDFs
    produced by the GitHub Action rather than ad-hoc local exports.

  - Note that technically only those pdfs that have changed (or which
    are new) need to be copied.

- In order to make the new/changed tutorials available from the
  SasView help documentation in the next release (and the developer
  builds) the following two steps need to be taken:

  - The pdf files above need to be copied to the /src/sas/sasview/media
    folder of the SasView repository and committed or git added.

  - If any new pdf tutorial (ie, a new .fodt) was created then the
    SasView documentation index needs to be updated by appropriately
    editing the /docs/sphinx-docs/source/user/tutorial.rst file in the
    SasView repository
