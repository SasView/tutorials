# tutorials
This repository is where contributed tutorials for SasView live!

.fodt files placed here are grabbed by Jenkins and built into pdf 
at https://jenkins.esss.dk/sasview/job/SasView_Tutorials/ 

Once the new/changes to tutorials are ready for general consumption the following two steps should be taken:
- All the pdf files should be copied to the /downloads folder of the website repository sasview.github.io.  This is effectively the release step for the tutorials, making them available from http://www.sasview.org/links.html
   - Note that technically only those pdfs that have changed (or are new) need to be copied
- In order to make the new/changes available from the SasView help documantation in the next release (and the developer builds) the following two steps need to be taken
   - the pdf files above need to be copied to the /src/sas/sasview/media folder of the SasView reposiotry and git added.
   - If any new pdf tutorial (new .fodt) was created the SasView documentation index needs to be updated by appropriately editing the /docs/sphinx-docs/source/user/tutorial.rst in the SasView repository
  
