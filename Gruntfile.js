module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({

        //Read the package.json (optional)
        pkg: grunt.file.readJSON('package.json'),
 
        // Metadata.
        meta: {
            basePath: '../../',
            srcPath: 'catalog/view/theme/cwdstore3/',
            deployPath: 'catalog/view/theme/cwdstore3/'
        },
 
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
                '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
                '* Copyright (c) <%= grunt.template.today("yyyy") %> ',
 
        // Task configuration.
        concat: {
            options: {
                stripBanners: true
            },
            jsassets: {
                src: [
                    '<%= meta.srcPath %>assets/jquery-1.10.2.min.js',
                    '<%= meta.srcPath %>assets/jquery-migrate-1.2.1.js',

                    // '<%= meta.srcPath %>assets/bootstrap3/js/alert.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/button.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/carousel.js',
                    '<%= meta.srcPath %>assets/bootstrap3/js/collapse.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/dropdown.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/modal.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/tooltip.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/popover.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/scrollspy.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/tab.js',
                    // '<%= meta.srcPath %>assets/bootstrap3/js/affix.js',

                ],
                dest: '<%= meta.deployPath %>/js/allscripts.min.grunt.js'
            },
        },
        uglify: {
            options: {
              mangle: false
            },
            my_target: {
              files: {
                '<%= meta.deployPath %>/js/allscripts.min.grunt.js': ['<%= meta.deployPath %>/js/allscripts.min.grunt.js']
              }
            }
        },
    });
 
    // These plugins provide necessary tasks.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
 
    // Default tasks
    grunt.registerTask('default', ['concat','uglify']);
 
};