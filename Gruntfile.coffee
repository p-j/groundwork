module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:
      jade:
        files: '**/*.jade'
        tasks: ['jade:build']
      compass:
        files: '**/*.scss'
        tasks: ['compass:build', 'autoprefixer:build']
      coffee:
        files: '**/*.coffee'
        tasks: ['coffee']

    jade:
      build:
        files:
          'pages/home.html':              ['src/jade/home.jade']
          'pages/layout-a.html':          ['src/jade/layout-a.jade']
          'pages/layout-b.html':          ['src/jade/layout-b.jade']
          'pages/layout-c.html':          ['src/jade/layout-c.jade']
          'pages/grid.html':              ['src/jade/grid.jade']
          'pages/helpers.html':           ['src/jade/helpers.jade']
          'pages/typography.html':        ['src/jade/typography.jade']
          'pages/navigation.html':           ['src/jade/navigation.jade']
          'pages/buttons.html':           ['src/jade/buttons.jade']
          'pages/ui-elements.html':       ['src/jade/ui-elements.jade']
          'pages/tables.html':            ['src/jade/tables.jade']
          'pages/forms.html':             ['src/jade/forms.jade']
          'pages/icons.html':             ['src/jade/icons.jade']
          'pages/responsive-text.html':   ['src/jade/responsive-text.jade']
        options:
          pretty: true
      tests:
        files:
          'tests/test-buttons.html'                 : ['tests/src/jade/test-buttons.jade']
          'tests/test-grid.html'                    : ['tests/src/jade/test-grid.jade']
          'tests/test-conditional-helpers.html'     : ['tests/src/jade/test-conditional-helpers.jade']
          'tests/test-helpers.html'                 : ['tests/src/jade/test-helpers.jade']
          'tests/test-typography.html'              : ['tests/src/jade/test-typography.jade']
          'tests/test-ui-elements.html'             : ['tests/src/jade/test-ui-elements.jade']
          'tests/test-unresponsive-grid.html'       : ['tests/src/jade/test-unresponsive-grid.jade']
          'tests/test-unresponsive-ui-elements.html': ['tests/src/jade/test-unresponsive-ui-elements.jade']
          'tests/test-unresponsive-typography.html' : ['tests/src/jade/test-unresponsive-typography.jade']
          'tests/test-unresponsive-buttons.html'    : ['tests/src/jade/test-unresponsive-buttons.jade']

    compass:
      build:
        options:
          config: 'config.rb'
          trace: true
      tests:
        options:
          config: 'tests/config.rb'

    autoprefixer:
      build:
        options:
          browsers: ['last 2 versions']
        files:
          'css/groundwork.css': ['css/groundwork.css']
      tests:
        options:
          browsers: ['last 2 versions']
        files:
          'tests/css/test-buttons.css':                   ['tests/css/test-buttons.css']
          'tests/css/test-conditional-helpers.css':       ['tests/css/test-conditional-helpers.css']
          'tests/css/test-grid.css':                      ['tests/css/test-grid.css']
          'tests/css/test-helpers.css':                   ['tests/css/test-helpers.css']
          'tests/css/test-typography.css':                ['tests/css/test-typography.css']
          'tests/css/test-ui-elements.css':               ['tests/css/test-ui-elements.css']
          'tests/css/test-unresponsive-buttons.css':      ['tests/css/test-unresponsive-buttons.css']
          'tests/css/test-unresponsive-grid.css':         ['tests/css/test-unresponsive-grid.css']
          'tests/css/test-unresponsive-typography.css':   ['tests/css/test-unresponsive-typography.css']
          'tests/css/test-unresponsive-ui-elements.css':  ['tests/css/test-unresponsive-ui-elements.css']

    coffee:
      individual:
        expand: true
        cwd: 'src/coffee'
        src: ['components/*.coffee', 'plugins/*.coffee']
        dest: 'js'
        ext: '.js'
      concatenated:
        options:
          join: true
        files:
          "js/groundwork.all.js": ["src/coffee/components/*.coffee", "src/coffee/plugins/*.coffee"]

    uglify:
      minify:
        files:
          'js/groundwork.all.js': ['js/groundwork.all.js']

    cssmin:
      minify:
        expand: true
        cwd: 'css/'
        src: ['*.css', '!*.min.css']
        dest: 'css/'
        ext: '.css'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-autoprefixer'

  grunt.registerTask 'default',           ['watch']
  grunt.registerTask 'build',             ['jade:build', 'compass:build', 'autoprefixer:build', 'coffee']
  grunt.registerTask 'minify',            ['cssmin', 'uglify']
  grunt.registerTask "tests",             ['jade:tests', 'compass:tests', 'autoprefixer:tests']
