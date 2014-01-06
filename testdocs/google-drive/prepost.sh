#!/usr/bin/env bash

FILENAME=paper.tex
DELETE_SRC=0        # delete the tex file from our computer after making pdf?

if [[ $1 == "pre" ]]; then
	# Tip: Create a file on Google Docs, use the "Share" feature to
	# allow anybody to view the file that has the link. When viewing
	# the file in your browser, you should see a document ID value in
	# between two slashes in the URL. Copy that ID into the variable
	# below.
	DOC_ID="1vJebYXFlj4AAznRb2l3fZj7ogmp9QpzaV5QOZiX6xzs"
	URL="https://docs.google.com/feeds/download/documents/export/Export?id=${DOC_ID}&exportFormat=txt"
	echo "To view on Google Docs, visit:"
	echo "https://docs.google.com/document/d/${DOC_ID}/edit?usp=sharing"

	# Download the file. The awk command removes the Unicode Byte
	# Order Mark that Google Docs adds to the beginning of the file
	# that confuses some programs (chktex, for example) and is not
	# necessary.
	curl "${URL}" | awk '{if(NR==1)sub(/^\xef\xbb\xbf/,"");print}' > ${FILENAME}

	# Google docs will use unicode features (smart quotes). If you are
	# using latex or pdflatex that do not have support for these
	# things, you will need to convert those quotes using a script
	# like the following. 
	#
	# curl "${URL}" \
	# 	| awk '{if(NR==1)sub(/^\xef\xbb\xbf/,"");print}' \
	# 	| sed 's/“/``/g' \
	# 	| sed 's/”/"/g' \
	# 	| sed "s/’/\'/g" \
	# 	| sed "s/‘/\'/g" > ${FILENAME}
	
elif [[ $1 == "post" ]]; then
	if [[ ${DELETE_SRC} > 0 ]]; then
		rm -fv ${FILENAME};
	fi
fi
