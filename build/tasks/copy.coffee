gulp                = require 'gulp'
util                = require 'gulp-util'
rename              = require 'gulp-rename'
runsequence         = require 'run-sequence'
plumber             = require 'gulp-plumber'
buildConfig         = require '../config.json'

module.exports = (environment) ->
  gulp.task 'copy', ->
    gulp.src ["#{__dirname}/../#{buildConfig.in}/**/copy/**/*"], { base: "#{__dirname}/../#{buildConfig.in}" }
    .pipe plumber()
    .pipe rename((path) ->
      path.dirname = path.dirname.replace 'copy', ''
    )
    .pipe gulp.dest "#{__dirname}/../#{buildConfig.out}"
#
#  gulp.task 'copy', ->
#    gulp.src ['./static/copy/**/*'], { base: "#{__dirname}/../#{buildConfig.in}/copy" }
#    .pipe gulp.dest "#{__dirname}/../#{buildConfig.out}/"
#