#!/usr/bin/bash

# Description:
#   A simple script for checking the Downloads directory for AppImage files
#   Once an AppImage file is detected in Download it is moved to Applications folder

# Author:  RilCritch
# Updated: 05/04/2023

monitordir="${HOME}/Downloads/"
appsdir="${HOME}/Applications/" # Change if needed

inotifywait -m -r -e create --format '%f' "${monitordir}" | while read newfile
do
  extension=$(echo "${newfile}" | awk -F"." '{print $NF}')

  if [ $extension = 'AppImage' ];
  then
    mv $monitordir$newfile $appsdir
  fi
done
