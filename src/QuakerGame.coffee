class QuakerGame
        setup: ->
                @fps = document.getElementById("fps")
                @viewport = new Viewport({max_x: 800, max_y: 600})

                @background = new Sprite({image: "assets/images/back.jpg", x: 0, y: 0, scale: 1, anchor: "top_left"})
                @player = new Player({image: "assets/images/quaker.png", x: 400, y: 300, scale: 1, anchor: "center"})

                @hud = new HUD(@player, {x: 694, y: 4})

        update: ->
                mouse = new Object({x: jaws.mouse_x, y: jaws.mouse_y})
                @player.update(mouse)
                @fps.innerHTML = jaws.game_loop.fps

                @draw()

        draw: ->
                @viewport.draw(@background)
                @viewport.draw(@player)

                @hud.draw(@viewport)