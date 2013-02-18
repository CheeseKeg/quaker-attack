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

        console.log images

        jaws.assets.add(images)
        jaws.start(QuakerGame)