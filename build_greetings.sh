#!/bin/bash

start_dir=$PWD


# mkdir -p mods/org.astro mods/com.greetings

# -d is directory of where to place the files
# javac -d mods/org.astro \
#         src2/org.astro/module-info.java \
#         src2/org.astro/org/astro/World.java

# javac --module-path mods -d mods/com.greetings \
#         src2/com.greetings/module-info.java src2/com.greetings/com/greetings/Main.java


#
# Multi-module compilation
#

# javac -d mods --module-source-path src2 $(find src2 -name "*.java")

#
# Packaging
#

# mkdir mlib

# jar --create --file=mlib/org.astro@1.0.jar \
#     --module-version=1.0 -C mods/org.astro .

# jar --create --file=mlib/com.greetings.jar \
#     --main-class=com.greetings.Main -C mods/com.greetings .


# run
# java --module-path mods -m com.greetings/com.greetings.Main
# java --module-path mlib --module com.greetings

mkdir mods
javac -d mods --module-source-path src2 $(find src2 -name "*.java")

javac -d mods/com.greetings/ -p mods $(find src2/com.greetings/ -name "*.java")

java -p mods -m com.greetings/com.greetings.Main

