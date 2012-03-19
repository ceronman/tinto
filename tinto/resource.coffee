resource =

  images: []
  loadedCallbacks: []

  image: (path) ->
    img = new Image()
    img._loaded = false
    img._path = path
    img.onload = () =>
      img._loaded = true
      this.check()

    this.images.push(img)
    return img

  loadAll: () ->
    this.loadImages()

  loadImages: () ->
    for image in this.images
      image.src = image._path

  check: () ->
    for img in this.images
      if not img._loaded
        return

    for callback in this.loadedCallbacks
      callback()

  loaded: (callback) ->
    this.loadedCallbacks.push(callback)


tinto.resource = resource
