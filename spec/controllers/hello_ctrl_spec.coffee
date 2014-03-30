define ["controllers/hello_ctrl", "specenv"], () ->
    describe "HelloCtrl", () ->
        controller = null
        scope      = null

        beforeEach () ->
            module("controllers")
            inject ($controller, $rootScope) ->
                scope = $rootScope.$new()
                controller = $controller "HelloCtrl", $scope: scope

        it "says hello to the world", () ->
            expect(scope.name).toBe("World")
