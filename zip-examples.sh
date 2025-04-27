#!/bin/sh

cd source/examples

rm *.zip

for example in *
do
    echo Archiving $example ...
    cd $example
    zip \
    -r \
    ../$example.zip \
    .
    cd -
done
