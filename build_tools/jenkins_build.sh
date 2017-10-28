cd $WORKSPACE/tutorials

echo "Converting to PDF"
for i in *.fodt; do soffice --headless --convert-to pdf $i; done
