gulp                = require 'gulp'
util                = require 'gulp-util'
runsequence         = require 'run-sequence'
plumber             = require 'gulp-plumber'
less                = require 'gulp-less'
rename              = require 'gulp-rename'
minify              = require 'gulp-minify-css'
prefix              = require 'gulp-autoprefixer'
buildConfig         = require '../config.json'
_if                 = require 'gulp-if'

module.exports = (environment) ->
  gulp.task 'less', ->
    gulp.src ["#{__dirname}/../#{buildConfig.in}/**/less/app.less"], { base: "#{__dirname}/../#{buildConfig.in}" }
    .pipe plumber()
    .pipe less()
    .pipe prefix({
      browsers: ['last 2 versions']
      cascade: true
    })
    .pipe rename((path) ->
      path.dirname = path.dirname.replace 'less', 'css'
    )
    .pipe gulp.dest "#{__dirname}/../#{buildConfig.out}"
    .pipe _if(environment == 'production', minify())
    .pipe _if(environment == 'production', rename((path) ->
      path.basename = 'app.min'
    ))
    .pipe _if(environment == 'production', gulp.dest "#{__dirname}/../#{buildConfig.out}")