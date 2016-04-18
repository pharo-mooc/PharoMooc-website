#!/bin/sh

cd ..
echo Uploading files to files.pharo.org...
scp -r mooc files.pharo.org: 2>&1 | grep -v '.git'
echo uploading done
echo Moving files to webserver
ssh files.pharo.org sudo -u filepharosync cp -R ~/mooc /appli/files.pharo.org/ 2>&1 | grep -v '.git'
echo moving done
echo success
