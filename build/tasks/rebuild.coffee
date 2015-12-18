gulp                = require 'gulp'
util                = require 'gulp-util'
runsequence         = require 'run-sequence'
del                 = require 'del'
path                = require 'path'
recur_readdir_sync  = require 'recursive-readdir-sync'

buildConfig         = require '../config.json'

module.exports = (environment) ->
  gulp.task 'rebuild', (callback) ->
    util.log 'Starting application rebuild'
    runsequence 'clean', ['copy', 'less', 'images', 'coffee'], callback