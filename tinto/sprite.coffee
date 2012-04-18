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
      get: -> @image.width ? 0

    Object.defineProperty @prototype, "height",
      get: -> @image.height ? 0

    Object.defineProperty @prototype, "top",
      get: -> @y
      set: (value) -> @y = value

    Object.defineProperty @prototype, "left",
      get: -> @x
      set: (value) -> @x = value

    Object.defineProperty @prototype, "bottom",
      get: -> @y + @image.height
      set: (value) -> @y = value - @image.height

    Object.defineProperty @prototype, "bottom",
      get: -> @y + @image.height
      set: (value) -> @y = value - @image.height

    Object.defineProperty @prototype, "right",
      get: -> @x + @image.width
      set: (value) -> @x = value - @image.width

    Object.defineProperty @prototype, "centerY",
      get: -> @y + @image.height / 2
      set: (value) -> @y = value - @image.height / 2

    Object.defineProperty @prototype, "centerX",
      get: -> @x + @image.width / 2
      set: (value) -> @x = value - @image.width / 2


  # Public interface.
  Sprite: Sprite
