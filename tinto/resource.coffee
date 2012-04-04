tinto.resource =

  images: []
  loadedEvent: new tinto.EventEmitter()

  image: (path) ->
    img = new Image()
    img._loaded = false
    img._path = path
    img.onload = () =>
      img._loaded = true
      @check()
    @images.push(img)
    return img

  loadAll: () ->
    @loadImages()

  loadImages: () ->
    for image in @images
      image.src = image._path

  check: () ->
    for img in @images
      if not img._loaded
        return

    @loadedEvent.call()

  loaded: (callback) ->
    @loadedEvent.addCallback(callback)