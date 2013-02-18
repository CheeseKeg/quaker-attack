class HUD
        constructor: (@player)->
                @hpbar = new Sprite({image:"assets/images/bar.png", x:694, y:4, scale:1, anchor:"top_left"})
                @epbar = new Sprite({image:"assets/images/bar.png", x:694, y:18, scale:1, anchor:"top_left"})
                @hpbar.in = new Sprite({image:"assets/images/health.png", x:695, y:5, scale:1, anchor:"top_left"})
                @epbar.in = new Sprite({image:"assets/images/energy.png", x:695, y:19, scale:1, anchor:"top_left"})

        update: ->


        draw: (viewport)->
                viewport.draw(@hpbar)
                viewport.draw(@epbar)
                @hpbar.in.resizeTo(@player.hp, 10)
                @epbar.in.resizeTo(@player.ep, 10)
                viewport.draw(@hpbar.in)
                viewport.draw(@epbar.in)