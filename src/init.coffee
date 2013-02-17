jaws.onload = ->
        jaws.unpack()
        jaws.assets.add(["quaker.png","quaker-fire.png","back.jpg","bar.png","health.png","energy.png"])
        jaws.start(QuakerGame)
