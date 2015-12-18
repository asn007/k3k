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

uglify              = require 'gulp-uglify'

source              = require 'vinyl-source-stream'
eventstream         = require 'event-stream'

browserify          = require 'browserify'

bngann      = require 'browserify-ngannotate'

debowerify  = require 'debowerify'
coffeeify   = require 'coffeeify'
uglifyify   = require 'uglifyify'

module.exports = (environment) ->
  gulp.task 'coffee', ->
    bundles = []
    for k, v of buildConfig.tasks.coffee.bundles
      util.log "Preparing bundle: #{k}"
      bundle = browserify({
        entries: [ __dirname + '/../' + buildConfig.in + v ]
        transform: [ coffeeify, bngann, debowerify ]
        extensions: [ '.coffee' ]
      })
      .bundle()
      .pipe source 'app.bundle.js'
      .pipe _if(environment == 'production', uglify())
      .pipe gulp.dest "#{__dirname}/../#{buildConfig.out}/#{k}/javascript/"
      bundles.push bundle
    util.log 'Bundling...'
    return eventstream.merge.apply(null, bundles)