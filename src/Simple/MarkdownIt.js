"use strict";

const md = require("markdown-it");

exports._new = function(...args) {
  return function() {
    return md(...args);
  };
};

exports._render = function(text) {
  return function(md) {
    return function () {
      return md.render(text);
    };
  };
};
