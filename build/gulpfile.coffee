gulp                = require 'gulp'
util                = require 'gulp-util'
runsequence         = require 'run-sequence'
del                 = require 'del'
path                = require 'path'
recur_readdir_sync  = require 'recursive-readdir-sync'


###browserify  = require 'browserify'
prefix      = require 'gulp-autoprefixer'
spawn       = (require 'child_process').spawn
rename      = require 'gulp-rename'
imagemin    = require 'gulp-imagemin'

coffee      = require 'gulp-coffee'
less        = require 'gulp-less'
watch       = require 'gulp-watch'
plumber     = require 'gulp-plumber'
uglify      = require 'gulp-uglify'
minify      = require 'gulp-minify-css'
concat      = require 'gulp-concat'



bngann      = require 'browserify-ngannotate'

debowerify  = require 'debowerify'
coffeeify   = require 'coffeeify'
uglifyify   = require 'uglifyify'
source      = require 'vinyl-source-stream'

streamify   = require 'gulp-streamify'
###


environment = if process.env.APP_ENV? and process.env.APP_ENV == 'production' then 'production' else 'development'

util.log "Environment: #{environment}"

util.log 'Initializing modular build system...'
(recur_readdir_sync "#{__dirname}/tasks/").forEach (file) ->
  util.log "Bootstrapping #{ path.basename(file) }"
  require(file)(environment)


gulp.task 'default', ['build']