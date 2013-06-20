module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:
      coffee:
        files: '**/*.coffee'
        tasks: ['coffee']
      compass:
        files: '**/*.scss'
        tasks: ['compass:groundwork']
      jade:
        files: '**/*.jade'
        tasks: ['jade:groundwork']

    coffee:
      individual:
        expand: true
        cwd: 'src/coffee'
        src: ['components/*.coffee', 'plugins/*.coffee']
        dest: 'js'
        ext: '.js'

    compass:
      groundwork:
        options:
          config: 'config.rb'
          trace: true

    jade:
      tests:
        files:
          'test.html':         ['src/jade/test.jade']

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-jade'

  grunt.registerTask 'default',           ['watch']
  grunt.registerTask 'build',             ['coffee', 'compass:groundwork']
  grunt.registerTask "tests",             ['compass', 'jade:tests']
