define ["controllers/module"], (controllers) ->
    controllers.controller "HelloCtrl", ($scope) ->
        $scope.name = "World"
