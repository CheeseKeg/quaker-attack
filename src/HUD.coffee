class HUD
        constructor: (@player, position)->
                @hpbar = new Sprite({image: "assets/images/bar.png", x: position.x, y: position.y, scale: 1, anchor: "top_left"})
                @epbar = new Sprite({image: "assets/images/bar.png", x: position.x, y: position.y + 14, scale: 1, anchor: "top_left"})

                @hpbar.in = new Sprite({image: "assets/images/health.png", x: @hpbar.x + 1, y: @hpbar.y + 1, scale: 1, anchor: "top_left"})
                @epbar.in = new Sprite({image: "assets/images/energy.png", x: @epbar.x + 1, y: @epbar.y + 1, scale: 1, anchor: "top_left"})

        update: ->
                @hpbar.in.resizeTo(@player.hp, 10)
                @epbar.in.resizeTo(@player.ep, 10)


        draw: (viewport)->
                viewport.draw(@hpbar)
                viewport.draw(@epbar)
                viewport.draw(@hpbar.in)
                viewport.draw(@epbar.in)