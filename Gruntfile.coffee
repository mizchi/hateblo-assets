module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    connect:
      server:
        options:
          port: 8888
          base: '.'
    concat:
      vendor:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/backbone/backbone-min.js'
          'bower_components/hammerjs/dist/hammer.min.js'
        ]
        dest: 'dist/vendor.js'

    watch:
      coffee:
        files: "src/**/*.coffee",
        tasks: ["coffee"]

    coffee:
      compile:
        files:
          'dist/all.js': [
            "src/**/*.coffee"
          ]

  grunt.registerTask "run", ["coffee","connect", "watch:coffee"]
