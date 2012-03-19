window.onload = () ->
  canvas = new tinto.GameCanvas('gamecanvas')

  sprite = new tinto.Sprite
    image: tinto.resource.image('images/tinto.png')
    x: canvas.width / 2
    y: canvas.height / 2

  tinto.resource.loadAll()

  canvas.draw () ->
    sprite.draw()
