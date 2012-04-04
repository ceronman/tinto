class tinto.Sprite

  constructor: (options) ->
    for key, value of options
      this[key] = value

  draw: () ->
    tinto.activeCanvas.preserveContext (context) =>
      context.drawImage @image, @x, @y

