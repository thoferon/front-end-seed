define ["app", "angularroute"], (app) ->
    app.config ($routeProvider) ->

        $routeProvider.when "/",
            templateUrl: "partials/hello.html"
            controller: "HelloCtrl"

        $routeProvider.otherwise
            redirectTo: "/"
