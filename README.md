# tutorials
This repository is where contributed tutorials for SasView live!

.fodt files placed here are grabbed by Jenkins and built into pdf 
at https://jenkins.esss.dk/sasview/job/SasView_Tutorials/ 

Once any new/changed tutorials are ready for general consumption the 
following steps should be taken:

- All the pdf files should be copied to the /downloads folder of the 
  website repository sasview.github.io.  This is effectively the 
  release step for the tutorials, making them available from 
  http://www.sasview.org/links.html
  
  - For consistency, and to avoid rendering issues, the pdfs should 
    be downloaded from Jenkins AND NOT generated locally in LibreOffice, 
    etc.
  
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
  