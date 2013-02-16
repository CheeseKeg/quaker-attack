class QuakerGame
	setup: ->
		@fps = document.getElementById("fps")
		@viewport = new Viewport({max_x:800, max_y:600})
		
		@background = new Sprite({image:"back.jpg", x:0, y:0, scale:1, anchor:"top_left"})
		@player = new Sprite({image:"quaker.png", x:400, y:300, scale:1, anchor:"center"})
		@player.hpbar = new Sprite({image:"bar.png", x:694, y:4, scale:1, anchor:"top_left"})
		@player.epbar = new Sprite({image:"bar.png", x:694, y:18, scale:1, anchor:"top_left"})
		@player.hpbar.in = new Sprite({image:"health.png", x:695, y:5, scale:1, anchor:"top_left"})
		@player.epbar.in = new Sprite({image:"energy.png", x:695, y:19, scale:1, anchor:"top_left"})
		@player.hp = 100
		@player.ep = 100
		@player.bombs = 3
	update: ->
		mouse = new Object({x:jaws.mouse_x, y:jaws.mouse_y})
		move = new Object({x:mouse.x-@player.x, y:mouse.y-@player.y})
		dist = jaws.distanceBetween(@player, mouse)
		if dist > 40
			move.x *= 30 / dist
			move.y *= 30 / dist
		@player.x += move.x
		@player.y += move.y
		@player.x = if @player.x < 60 then 60 else if @player.x > 740 then 740 else @player.x
		@player.y = if @player.y < 50 then 50 else if @player.y > 400 then 400 else @player.y
		@fps.innerHTML = jaws.game_loop.fps
		@viewport.draw(@background)
		@viewport.draw(@player)
		# HUD
		@viewport.draw(@player.hpbar)
		@viewport.draw(@player.epbar)
		@player.hpbar.in.resizeTo(@player.hp, 10)
		@player.epbar.in.resizeTo(@player.ep, 10)
		@viewport.draw(@player.hpbar.in)
		@viewport.draw(@player.epbar.in)

jaws.onload = ->
	jaws.unpack()
	jaws.assets.add(["quaker.png","quaker-fire.png","back.jpg","bar.png","health.png","energy.png"])
	jaws.start(QuakerGame)

