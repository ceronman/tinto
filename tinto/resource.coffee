# tinto.resource module.

@tinto.resource = do ->

  # Private
  loadedEvent = new tinto.EventEmitter()

  # Public interface
  images: []
  sounds: []

  image: (path) ->
    image = document.createElement('img')
    image._loaded = false
    image._path = path
    image.onload = =>
      image._loaded = true
      @check()
    @images.push(image)
    return image

  sound: (path) ->
    sound = document.createElement('audio')
    sound._loaded = false
    sound._path = path
    sound.onload = =>
      console.log 'sound loaded'
      sound._loaded = true
      @check()
    @sounds.push(sound)
    return sound

  loadAll: ->
    @loadImages()
    @loadSounds()

  loadImages: ->
    for image in @images
      image.src = image._path

  loadSounds: ->
    for sound in @sounds
      sound.src = sound._path

  check: ->
    for img in @images
      if not img._loaded
        return

    loadedEvent.call()

  loaded: (callback) ->
    loadedEvent.addCallback(callback)
