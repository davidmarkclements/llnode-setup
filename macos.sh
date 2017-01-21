#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew install llnode
    mkdir -p ~/Library/Application\ Support/LLDB/PlugIns
    ln -sf /usr/local/opt/llnode/llnode.dylib  ~/Library/Application\ Support/LLDB/PlugIns/
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
    
fi

