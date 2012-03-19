resource =

  images: []

  image: (path) ->
    img = new Image()
    img._loaded = false
    img._path = src
    img.onload () =>
      img._loaded = true
      this.check()

    this.images.push(img)

  loadAll: () ->
    this.loadImages()

  loadImages: () ->
    for image in this.images
      image.src = image._path

  check: () ->
    for img in this.images
      if not img.loaded
        return

    for callback in this.loaded
      callback()


tinto.resource = resource
