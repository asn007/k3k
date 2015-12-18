gulp                = require 'gulp'
util                = require 'gulp-util'
runsequence         = require 'run-sequence'
del                 = require 'del'
path                = require 'path'
recur_readdir_sync  = require 'recursive-readdir-sync'

buildConfig         = require '../config.json'

module.exports = (environment) ->
  gulp.task 'build', (callback) ->
    util.log 'Starting application build'
    runsequence ['copy', 'less', 'images', 'coffee'], callback