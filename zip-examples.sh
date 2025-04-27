#!/bin/sh

cd source/examples

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
