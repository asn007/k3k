gulp                = require 'gulp'
util                = require 'gulp-util'
runsequence         = require 'run-sequence'
plumber             = require 'gulp-plumber'
imagemin            = require 'gulp-imagemin'
buildConfig         = require '../config.json'

module.exports = (environment) ->
  gulp.task 'images', ->
    gulp.src ["#{__dirname}/../#{buildConfig.in}/**/images/**/*"], { base: "#{__dirname}/../#{buildConfig.in}" }
    .pipe plumber()
    .pipe imagemin({
      optimizationLevel: 5
      interlaced: true
      multipass: true
      progressive: true
    })
    .pipe gulp.dest "#{__dirname}/../#{buildConfig.out}/"