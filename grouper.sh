#!/bin/bash
echo
echo Hello. Grouper here
echo - - - - - - - - - -
echo
echo - JS files

# Empty js_code file
echo "" > js_code.js.all
echo "/* File with all JS code */" > js_code.js.all

for f in *.js;
do
	echo "Putting file $f into .all";
	echo "\n/*--- $f ---*/\n" >> js_code.js.all
	cat $f >> js_code.js.all
done

# Rename js_code.js.all
mv js_code.js.all js_code.js

# Compress js file
java -jar yuicompressor-2.4.7pre.jar js_code.js -o js_code.min.js

rm js_code.js
mv js_code.min.js js_code.min

echo
echo - CSS files

# Empty css_code file
echo "" > css_code.css.all
echo "/* File with all CSS code */" > css_code.css.all

for f in *.css;
do
	echo "Putting file $f into .all";
	echo "\n/*--- $f ---*/\n" >> css_code.css.all
	cat $f >> css_code.css.all
done

# Rename css_code.css.all
mv css_code.css.all css_code.css

# Compress css file
java -jar yuicompressor-2.4.7pre.jar css_code.css -o css_code.min.css

rm css_code.css
mv css_code.min.css css_code.min