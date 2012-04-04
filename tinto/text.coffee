tinto.text = {}

class tinto.text.Label

  constructor: (options) ->
    for key, value of options
      this[key] = value

  draw: () ->
    tinto.activeCanvas.preserveContext (context) =>
      context.font = @font ? '14pt Serif italic'
      context.fillStyle = @color ? 'white'
      context.textAlign = @alignment ? 'start'
      context.fillText @text, @x, @y
