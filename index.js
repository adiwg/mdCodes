'use strict';

const glob = require('glob');
const path = require('path');
const all = {};

glob.sync('./resources/js/*.js').forEach(function(file) {
  const obj = require(path.resolve(file));
  const name = path.basename(file, '.js');
  if (0 === name.indexOf('iso_')) {
    all[name] = obj;
  }
});

module.exports = exports = all;
