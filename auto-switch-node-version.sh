#!/bin/bash

newNodeVersion=$1
oldNodeVersion=`node -v`

source ~/.nvm/nvm.sh

if nvm use --silent ${newNodeVersion}; then
   echo "switch node ${newNodeVersion} success!!!"
else
   nvm install ${newNodeVersion}
fi

if eval $2; then
    nvm use --silent ${oldNodeVersion}
else
    nvm use --silent ${oldNodeVersion}
    exit 1
fi
echo "switch node ${oldNodeVersion} back!!!"
exit 0