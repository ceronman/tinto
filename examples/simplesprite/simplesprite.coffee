window.onload = () ->
  canvas = new tinto.canvas.GameCanvas('gamecanvas')

  sprite = new tinto.sprite.Sprite
    image: tinto.resource.image('../resources/tinto.png')
    x: canvas.width / 2
    y: canvas.height / 2

  tinto.resource.loadAll()

  canvas.draw () ->
    sprite.draw()
