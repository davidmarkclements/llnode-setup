#!/usr/bin/env node

var os = require('os')
var getos = require('getos')
var path = require('path')
var cp = require('child_process')

var platform = os.platform()

if (platform === 'darwin') {
  cp.spawn('bash', [path.join(__dirname, 'macos.sh')], {stdio: 'inherit'})
  return
}

if (platform === 'linux') {
  getos(function (err, os) {
    if (!/ubuntu/i.test(os.dist)) {
      throw Error('This Linux distro is not supported (PR\'s welcome!)')
    }
    cp.spawn('bash', [path.join(__dirname, 'ubuntu.sh')], {stdio: 'inherit'})
  })
  return
}

throw Error('Operating System not supported')