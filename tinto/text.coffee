class Label

  constructor: (options) ->
    for key, value of options
      this[key] = value

  draw: () ->
    tinto.activeCanvas.preserveContext (context) =>
      context.font = this.font ? '14pt Serif italic'
      context.fillStyle = this.color ? 'white'
      context.textAlign = this.alignment ? 'start'
      context.fillText(this.text, this.x, this.y)


this.tinto.text =
  Label: Label

