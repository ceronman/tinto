# tinto.sprite module.

@tinto.sprite = do ->

  class Sprite

    constructor: (options) ->
      for key, value of options
        this[key] = value

    draw: ->
      tinto.activeCanvas.preserveContext (context) =>
        context.drawImage @image, @x, @y

    Object.defineProperty @prototype, "width",
      get: ->
        if image? and image.width != 0
          @image.width
        else
          console.warn "Image apparently not loaded."

    Object.defineProperty @prototype, "height",
      get: ->
        if image? and image.width != 0
          @image.height
        else
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
      set: (value) ->
        @x = value - @width / 2
        console.log "setting centerX"


  # Public interface.
  Sprite: Sprite
