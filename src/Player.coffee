class Player extends jaws.Sprite
        constructor: (options)->
                super(options)

                @hp = 100
                @ep = 100
                @bombs = 3

        update: (mouse)->
                move = new Object({x:mouse.x-@x, y:mouse.y-@y})
                dist = jaws.distanceBetween(this, mouse)
                if dist > 40
                        move.x *= 30 / dist
                        move.y *= 30 / dist
                @x += move.x
                @y += move.y
                @x = if @x < 60 then 60 else if @x > 740 then 740 else @x
                @y = if @y < 50 then 50 else if @y > 400 then 400 else @y
