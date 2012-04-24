# tinto.sprite module.

@tinto.sprite = do ->

  class Sprite

    constructor: (options) ->
      @x = 0
      @y = 0
      @rotation = 0
      @scale = 1.0

      if options.image?
        @image = options.image
        @image.addEventListener "load", =>
          console.log "loaded sprite", @image.width, @image.height
          for key, value of options
            @[key] = value

    draw: ->
      if not @image?
        console.warn "Image not loaded."

      context = tinto.activeCanvas.context2D

      if @rotation != 0 or @scale != 1.0
        context.save()
        context.translate @centerX, @centerY
        context.rotate (@rotation * Math.PI / 180)
        context.scale @scale, @scale
        context.drawImage @image, -(@width/2), -(@height/2)
        context.restore()
      else
        context.drawImage @image, @x, @y

    Object.defineProperty @prototype, "width",
      get: ->
        if @image? and @image.width != 0
          @image.width
        else
          console.log @image.width, @image.height
          console.warn "Image apparently not loaded."

    Object.defineProperty @prototype, "height",
      get: ->
        if @image? and @image.height != 0
          @image.height
        else
          console.log @image.width, @image.height
          console.warn "Image apparently not loaded."

    Object.defineProperty @prototype, "top",
      get: -> @y
      set: (value) -> @y = value

    Object.defineProperty @prototype, "left",
      get: -> @x
      set: (value) -> @x = value

    Object.defineProperty @prototype, "bottom",
      get: -> @y + @height
      set: (value) -> @y = value - @height

    Object.defineProperty @prototype, "right",
      get: -> @x + @width
      set: (value) -> @x = value - @width

    Object.defineProperty @prototype, "centerY",
      get: -> @y + @height / 2
      set: (value) -> @y = value - @height / 2

    Object.defineProperty @prototype, "centerX",
      get: -> @x + @width / 2
      set: (value) -> @x = value - @width / 2

  # Public interface.
  Sprite: Sprite
