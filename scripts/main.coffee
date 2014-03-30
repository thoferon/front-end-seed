require.config
    baseUrl: "/js"

    paths:
        angular:      "lib/angular"
        angularroute: "lib/angular-route"

    shim:
        angular:
            exports: 'angular'

        angularroute:
            deps:  ["angular"]

    deps: ["bootstrap"]
