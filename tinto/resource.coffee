# tinto.resource module.

@tinto.resource = do ->

  # Private
  loadedEvent = new tinto.EventEmitter()

  # Public interface
  images: []
  sounds: []
  _loaded: false

  image: (path) ->
    if @_loaded
      console.warn 'Resources already loaded.'

    image = document.createElement 'img'
    image._loaded = false
    image._path = path

    image.addEventListener "load", =>
      image._loaded = true
      @check()

    @images.push image
    return image

  sound: (path) ->
    if @_loaded
      console.warn 'Resources already loaded.'

    sound = document.createElement 'audio'
    sound._loaded = false
    sound._path = path

    sound.addEventListener "canplaythrough", =>
      sound._loaded = true
      @check()

    @sounds.push sound
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
    for image in @images
      if not image._loaded
        return

    for sound in @sounds
      if not sound._loaded
        return

    loadedEvent.call()
    @_loaded = true

  loaded: (callback) ->
    loadedEvent.addCallback callback
