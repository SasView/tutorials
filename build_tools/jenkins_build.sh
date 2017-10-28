cd $WORKSPACE/tutorials

for i in *.fodt; do soffice --headless --convert-to pdf $i; done
