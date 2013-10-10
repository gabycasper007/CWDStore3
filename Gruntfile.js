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
            js: {
                src: [
                    '<%= meta.srcPath %>/jquery-1.10.2.min.js',
                    '<%= meta.srcPath %>/jquery-migrate-1.2.1.js',

                    '<%= meta.srcPath %>/bootstrap-3.0.0/transition.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/alert.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/button.js',
                    '<%= meta.srcPath %>/bootstrap-3.0.0/carousel.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/collapse.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/dropdown.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/modal.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/tooltip.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/popover.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/scrollspy.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/tab.js',
                    // '<%= meta.srcPath %>/bootstrap-3.0.0/affix.js',

                    // '<%= meta.srcPath %>/bootstrap-3.0.0.min.js',
                    '<%= meta.srcPath %>/custom.js'
                ],
                dest: '<%= meta.deployPath %>/allscripts.min.grunt.js'
            },
            jsassets {
                src: [
                    '<%= meta.srcPath %>/assets/jquery-1.10.2.min.js',
                    '<%= meta.srcPath %>/assets/jquery-migrate-1.2.1.js',

                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/alert.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/button.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/carousel.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/collapse.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/dropdown.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/modal.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/tooltip.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/popover.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/scrollspy.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/tab.js',
                    '<%= meta.srcPath %>/assets/assets/bootstrap3/js/affix.js',

                ],
                dest: '<%= meta.deployPath %>/js/allscripts.min.grunt.js'
            },
            css: {
                src: [
                    '<%= meta.srcPath %>/../css/theme.css',

                    '<%= meta.srcPath %>/../css/sass-bootstrap.css',


                    '<%= meta.srcPath %>/../../../plugins/wysija-newsletters/css/validationEngine.jquery.css',
                    '<%= meta.srcPath %>/../../../plugins/contact-form-7/includes/css/styles.css',
                    '<%= meta.srcPath %>/../css/style.css', '<%= meta.srcPath %>/../css/customstyles.css',
                    '<%= meta.srcPath %>/../css/mobile.css'
                ],
                dest: '<%= meta.deployPath %>/../style.css'
            }
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
        cssmin: {
          css:{
            src: '<%= meta.deployPath %>/../style.css',
            dest: '<%= meta.deployPath %>/../style.css'
          }
        },
        compass: {
            scss: {
              options: {
                sassDir: [
                    '<%= meta.srcPath %>/../css/sass/',
                ],
                cssDir: '<%= meta.srcPath %>/../css/',
                raw: 'preferred_syntax = :sass\n' // Use `raw` since it's not directly available
              }
            },
            bootstrap: {
                options: {
                sassDir: [
                    '<%= meta.srcPath %>/../css/bootstrap-3.0.0/'
                ],
                cssDir: '<%= meta.srcPath %>/../css/',
                raw: 'preferred_syntax = :sass\n' // Use `raw` since it's not directly available
              }
            }
        },
        sass: {
            dist: {
                files: {
                    '<%= meta.srcPath %>/../css/style.css': '<%= meta.srcPath %>/../css/sass/style.scss',
                }
            }
        },
        watch: {
            /*test: {
                files: [
                    '<%= meta.srcPath %>/../css/sass/style.scss',
                ],
                tasks: ['sass'],
                options: {
                  livereload: true,
                },
            },*/
            scss: {
                files: [
                    '<%= meta.srcPath %>/../css/sass/*.scss',
                ],
                tasks: ['compass:scss'],
                options: {
                  livereload: true,
                },
            },
            bootstrap: {
                files: [
                    '<%= meta.srcPath %>/../css/sass/*.scss',
                ],
                tasks: ['compass:bootstrap','concat:css','cssmin'],
                options: {
                  livereload: true,
                },
            },
            js: {
                files: ['<%= meta.srcPath %>/../js/custom.js'],
                tasks: ['concat:js','uglify'],
                options: {
                  livereload: true,
                },
            },
            css: {
                files: [
                    '<%= meta.srcPath %>/../css/customstyles.css',
                    '<%= meta.srcPath %>/../css/mobile.css',
                    '<%= meta.srcPath %>/../css/theme.css',
                    '<%= meta.srcPath %>/../style.css',
                ],
                tasks: ['concat:css','cssmin'],
                options: {
                  livereload: true,
                },
            }
        },
    });
 
    // These plugins provide necessary tasks.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-css');
    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-compass-multiple');
    grunt.loadNpmTasks('grunt-sass');
 
    // Default tasks
    grunt.registerTask('jsassets',['concat:jsassets','uglify']);

    grunt.registerTask('default', ['watch']);
    grunt.registerTask('minifica', ['concat','uglify','cssmin']);
 
};