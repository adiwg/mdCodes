#!/usr/bin/env node

'use strict';

let fs = require('fs');
let buildify = require('buildify');
let rimraf = require('rimraf');
let path = 'resources/js';

console.log('Start Preprocess for npm publishing')

if (fs.existsSync(path)) {
  rimraf.sync(path);
  console.log('Removed existing resources/js files');
} else {
  console.log('No existing resources/js files');
}

fs.mkdirSync(path);
console.log('Created resources/js');

let files = fs.readdirSync('resources/json');

for (let file of files) {
  let name = path + '/' + file.split('.')[0] + '.js';

  buildify()
    .load('resources/json/' + file)
    .perform(function(content) {
      return 'module.exports = ' + content + ';';
    })
    .save(name);
  //console.log('Created ' + name);
}

process.exit();
