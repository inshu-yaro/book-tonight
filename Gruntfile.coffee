livereloadPort = 35729
httpServerPort = 9000

fs         = require 'fs'
path       = require 'path'
loremIpsum = require 'lorem-ipsum'

localConfig = JSON.parse fs.readFileSync('.local.json')

lorem = (count, options={}) ->
  if typeof count == 'number'
    options.count = count
  else
    options = count ? {}
  options.units ?= 'words'
  loremIpsum options

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    watch:
      public:
        files: ['assets/**/*', '!assets/css/**/*.styl', '!assets/css/**/*.less', '!assets/js/**/*.coffee']
        tasks: ['newer:copy:public']
      components:
        files: ['.components/**/*', '!**/src/**']
        tasks: ['newer:copy:components']
      coffee:
        cwd: 'assets/js'
        files: 'assets/js/**/*.coffee'
        tasks: ['brerror:newer:coffee:dev']
      stylesheets:
        cwd: 'assets/css'
        files: 'assets/css/**/*.styl'
        tasks: ['brerror:newer:stylus:dev']
      views:
        cwd: 'views'
        files: 'views/**/*.jade'
        tasks: ['brerror:newer:jade:dev']
      options:
        livereload: livereloadPort

    coffee:
      dev:
        files: [
          expand: true
          cwd: 'assets'
          src: ['js/**/*.coffee']
          dest: 'public'
          ext: '.js'
        ]

    stylus:
      dev:
        files: [
          expand: true
          cwd: 'assets'
          src: ['css/**/*.styl', '!css/**/_*.styl']
          dest: 'public'
          ext: '.css'
        ]
        options:
          compress: false
      options:
        use: [
          require 'axis-css'
        ]

    jade:
      dev:
        files: [
          expand: true
          cwd: 'views'
          src: ['**/*.jade', '!**/_*.jade', '!layout.jade']
          dest: 'public'
          ext: '.html'
        ]
        options:
          pretty: true
          data:
            lorem: lorem
            apiKey: localConfig.apiKey

    connect:
      server:
        options:
          port: httpServerPort
          keepalive: true
          debug: true
          base: 'public'
          useAvailablePort: true
          open: true
          livereload: true

    copy:
      public:
        expand: true
        cwd: 'assets'
        src: ['**/*', '!css/**/*.styl', '!css/**/*.less', '!js/**/*.coffee']
        dest: 'public'
      components:
        expand: true
        cwd: '.components'
        src: ['**/*', '!**/src/**']
        dest: 'public/components'

    concurrent:
      start:
        tasks: ['connect', 'watch', 'brerror:server']
        options:
          logConcurrentOutput: true
          gruntPath: path.join __dirname, 'node_modules', 'grunt-cli', 'bin', 'grunt'


  searchWord = (word, file, callback) ->
    fs.readdir file, (err, files) ->
      return unless err is null
      files.forEach (f) ->
        filepath = path.join file, f
        stat = fs.statSync filepath
        if stat.isDirectory()
          searchWord word, filepath, callback
        else
          fs.readFile filepath, 'utf8', (err, data) ->
            return unless err is null
            if data.indexOf(word) > -1
              callback filepath

  grunt.event.on 'watch', (action, filepath, task) ->
    return unless task in ['coffee', 'stylesheets', 'views']
    cwd = path.join __dirname, grunt.config("watch.#{task}.cwd")
    filename = path.basename filepath, path.extname(filepath)
    searchWord filename, cwd, (file) ->
      date = new Date()
      fs.utimes file, date, date

  grunt.registerTask 'compile:dev', [
    'copy'
    'jade:dev'
    'stylus:dev'
    'coffee:dev'
  ]
  grunt.registerTask 'default', ['compile:dev', 'concurrent:start']
