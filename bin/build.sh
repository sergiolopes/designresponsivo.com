#!/bin/bash

# compress html
for file in `find $1  -name '*.html'`; do
	echo Compressing $file
	htmlcompressor $file > /tmp/designresponsivo.tmp
	mv /tmp/designresponsivo.tmp $file
done

# compress css
for file in `find $1  -name '*.css'`; do
	echo Compressing $file
	yuicompressor $file > /tmp/designresponsivo.tmp
	mv /tmp/designresponsivo.tmp $file
done

# compress js
for file in `find $1  -name '*.js'`; do
	echo Compressing $file
	yuicompressor $file > /tmp/designresponsivo.tmp
	mv /tmp/designresponsivo.tmp $file
done