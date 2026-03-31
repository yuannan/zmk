#!/usr/bin/env bash

mkdir -p build;
pushd build;

cp ../../glove80-zmk-config/config/glove80.conf   .;
cp ../../glove80-zmk-config/config/glove80.keymap .;

popd;

cp -f $(nix-build -A glove80_combined --no-out-link)/glove80.uf2 ./build/;
