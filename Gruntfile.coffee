module.exports = (grunt) ->
    pkg = grunt.file.readJSON "package.json"
    versioned_name = pkg["name"] + "-" + pkg["version"]

    grunt.initConfig
        coffee:
            compile:
                expand: true
                cwd: "scripts/"
                src: ["{,*/}*.coffee"]
                dest: "dist/js/"
                ext: ".js"

        sass:
            compile:
                expand: true
                cwd: "styles/"
                src: ["{,*/}*.scss"]
                dest: "dist/css/"
                ext: ".css"

        copy:
            js:
                expand: true
                flatten: true
                src: [
                    "components/angular/angular.js",
                    "components/angular-route/angular-route.js",
                    "components/requirejs/require.js",
                    "components/requirejs-domready/domReady.js"
                    ]
                dest: "dist/js/lib/"

            css:
                expand: true
                flatten: true
                src: [
                    "components/bootstrap/dist/css/bootstrap.css",
                    "components/bootstrap/dist/css/bootstrap.css.map"
                    ]
                dest: "dist/css/lib/"

        requirejs:
            minify:
                options:
                    baseUrl: "dist/"
                    optimizeCss: "standard"
                    appDir: ""
                    dir: "dist-minified"

        compress:
            package:
                options:
                    archive: versioned_name + ".tar.gz"

                files: [
                    {
                        expand: true
                        cwd: "public"
                        src: ["**/*"]
                        dest: versioned_name
                    }, {
                        expand: true
                        cwd: "dist-minified"
                        src: ["**/*"]
                        dest: versioned_name
                    }
                    ]

        connect:
            server:
                options:
                    keepalive: true
                    port: 9000
                    base: ["public", "dist"]

        karma:
            unit:
                configFile: "karma.conf.coffee"
                singleRun: true

            unit_loop:
                configFile: "karma.conf.coffee"

        clean: ["dist", "dist-minified"]

    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-sass"
    grunt.loadNpmTasks "grunt-contrib-copy"
    grunt.loadNpmTasks "grunt-contrib-requirejs"
    grunt.loadNpmTasks "grunt-contrib-compress"
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-karma"
    grunt.loadNpmTasks "grunt-contrib-clean"

    grunt.registerTask "default", [
        "copy:js",
        "copy:css",
        "coffee:compile",
        "sass:compile"
        ]

    grunt.registerTask "package", [
        "clean",
        "default",
        "requirejs:minify",
        "compress:package"
        ]

    grunt.registerTask "server", ["connect"]

    grunt.registerTask "test", ["karma:unit"]
    grunt.registerTask "test_loop", ["karma:unit_loop"]
