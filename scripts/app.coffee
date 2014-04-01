define [
    "angular",
    "angularroute",
    "controllers"
    ], (angular) ->

        app = angular.module "app", [
            "controllers",
            "ngRoute"
            ]

        app.config ($routeProvider) ->
            $routeProvider.when "/",
                templateUrl: "partials/hello.html"
                controller: "HelloCtrl"

            $routeProvider.otherwise
                redirectTo: "/"

        app
