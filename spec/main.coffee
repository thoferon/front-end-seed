allTestFiles = []
TEST_REGEXP  = /(spec|test)(\.coffee)?(\.js)?$/i
pathToModule = (path) ->
    "../" + path.replace(/^\/base\//, "").replace(/\.js$/, "").replace(/\.cofee$/, "")

Object.keys(window.__karma__.files).forEach (file) ->
    # Normalize paths to RequireJS module names.
    allTestFiles.push pathToModule(file) if TEST_REGEXP.test(file)
    return

require.config
    # Karma serves files under /base, which is the basePath from your config file
    baseUrl: "/base/scripts"

    paths:
        angular:      "../components/angular/angular"
        angularroute: "../components/angular-route/angular-route"
        angularmocks: "../components/angular-mocks/angular-mocks"
        specenv:      "../spec/specenv"

    shim:
        angular:
            exports: 'angular'

        angularroute:
            deps:  ["angular"]

        angularmocks:
            deps: ["angular"]

    # dynamically load all test files
    deps: allTestFiles

    # we have to kickoff jasmine, as it is asynchronous
    callback: window.__karma__.start
