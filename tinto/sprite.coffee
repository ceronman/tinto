class Sprite
  constructor: (options) ->
    for key, value of options
      this[key] = value

  draw: () ->
    tinto.activeCanvas.preserveContext (context) =>
      context.drawImage(this.image, this.x, this.y)

this.tinto.Sprite = Sprite
