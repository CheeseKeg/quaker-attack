SIZE = {max_x: 800, max_y: 600}

jaws.onload = ->
        jaws.unpack()
        jaws.assets.load("config.json",
                (-> loadAssets()),
                (-> alert "Unable to load config.json!"))

loadAssets = ->
        config = jaws.assets.data["config.json"]

        images = []
        for image in config.assets.images
                images.push(config.asset_root + config.assets.image_root + image)

        jaws.assets.add(images)
        jaws.start(QuakerGame)