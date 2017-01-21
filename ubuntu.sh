#!/bin/bash

sudo apt-get -y install build-essential git-all lldb-3.8 lldb-3.8-dev lldb python-pip python-dev

if [ $? -ne 0 ]
then 
  exit $?
fi

pip install six

if [ $? -ne 0 ]
then 
  exit $?
fi

git clone https://github.com/nodejs/llnode.git

cd llnode

git checkout master # in case there's already llnode

git pull # in case there's already llnode

git clone https://chromium.googlesource.com/external/gyp.git tools/gyp

./gyp_llnode -Dlldb_dir=/usr/lib/llvm-3.8/

if [ $? -ne 0 ]
then 
  exit $?
fi

make -C out/ -j9

if [ $? -ne 0 ]
then 
  exit $?
fi

sudo make install-linux

if [ $? -ne 0 ]
then 
  exit $?
fi

cd ..
echo ""
echo "Looking good! Let's check if lldb and llnode are installed..."
echo "v8 help" | lldb | grep "Syntax: v8" > /dev/null 2>&1
if [ $? -eq 0 ]
then
  echo "Looks like setup was successful!"
  exit 0
else
  echo "Tried to run the 'v8 help' command in lldb but it failed :("
  exit 1
fi
