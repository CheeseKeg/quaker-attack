/**
 *
 *	@source http://github.com/aderosier/quaker-attack/quaker-attack.js
 *	
 *	@licstart
 *
 *	Copyright (C) 2013  Andrew DeRosier
 *
 *	The JavaScript code in this page is free software: you can
 *	redistribute it and/or modify it under the terms of the GNU
 *	General Public License (GNU GPL) as published by the Free Software
 *	Foundation, either version 3 of the License, or (at your option)
 *	any later version.  The code is distributed WITHOUT ANY WARRANTY;
 *	without even the implied warranty of MERCHANTABILITY or FITNESS
 *	FOR A PARTICULAR PURPOSE.  See the GNU GPL for more details.
 *
 *	As additional permission under GNU GPL version 3 section 7, you
 *	may distribute non-source (e.g., minimized or compacted) forms of
 *	that code without the copy of the GNU GPL normally required by
 *	section 4, provided you include this license notice and a URL
 *	through which recipients can access the Corresponding Source.   
 *
 *	@licend
 *
 */

function QuakerGame() {
	var fps
	var width = 800
	var height = 600
	var viewport
	var score = 0
	var background
	var player
	
	// Called once when a game state is activated. Use it for one-time setup code.
	this.setup = function() {
		fps = document.getElementById("fps")
		viewport = new jaws.Viewport({max_x: width, max_y: height})
		
		background = new jaws.Sprite({
			image:"back.jpg", x:0, y:0, scale:1, anchor:"top_left"
		})
		player = new jaws.Sprite({
			image:"quaker.png", x:width/2, y:height/2, scale:1, anchor:"center"
		})
		player.health_bar = new jaws.Sprite({
			image:"bar.png", x:694, y:4, scale:1, anchor:"top_left"
		})
		player.energy_bar = new jaws.Sprite({
			image:"bar.png", x:694, y:18, scale:1, anchor:"top_left"
		})
		player.health_bar.inside = new jaws.Sprite({
			image:"health.png", x:695, y:5, scale:1, anchor:"top_left"
		})
		player.energy_bar.inside = new jaws.Sprite({
			image:"energy.png", x:695, y:19, scale:1, anchor:"top_left"
		})
		player.health = 100
		player.energy = 100
		player.bombs = 3
	}

	// update() will get called each game tick with your specified FPS. Put game logic here.
	this.update = function() {
		// Move the player according to the mouse position
		var mouse = new Object({ x:jaws.mouse_x, y:jaws.mouse_y })
		var move = new Object({ x:mouse.x - player.x, y:mouse.y - player.y })
		var dist = jaws.distanceBetween(player, mouse)
		// Maximum speed is 30, so the player can't jump around the screen
		if(dist > 30){
			move.x *= 30 / dist
			move.y *= 30 / dist
		}
		player.x += move.x
		player.y += move.y
		// Lock player within the game space
		if(player.x < 60){ player.x = 60 } else if(player.x > 740){ player.x = 740 }
		if(player.y < 50){ player.y = 50 } else if(player.y > 400){ player.y = 400 }
		fps.innerHTML = jaws.game_loop.fps
	}

	// Directly after each update draw() will be called. Put all your on-screen
	// operations here.
	this.draw = function() {
		jaws.clear()
		viewport.draw(background)
		viewport.draw(player)
		// HUD
		viewport.draw(player.health_bar)
		viewport.draw(player.energy_bar)
		player.health_bar.inside.resizeTo(player.health, 10)
		player.energy_bar.inside.resizeTo(player.energy, 10)
		viewport.draw(player.health_bar.inside)
		viewport.draw(player.energy_bar.inside)
	}
}

jaws.onload = function() {
	jaws.unpack()
	jaws.assets.add([
		"quaker.png","quaker-fire.png",
		"back.jpg",
		"bar.png","health.png","energy.png"
	])
	// Our convenience function jaws.start() will load assets, call setup and 
	// loop update/draw in 60 FPS
	jaws.start(QuakerGame)
}
