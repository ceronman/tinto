window.onload = () ->
  canvas = new tinto.GameCanvas('gamecanvas')

  sprite = new tinto.Sprite
    image: tinto.resource.image('../resources/tinto.png')
    x: canvas.width / 2
    y: canvas.height / 2

  tinto.resource.loadAll()

  canvas.update (dt) ->
    if tinto.input.keyDown("right")
      sprite.x += 100 * dt

    if tinto.input.keyDown("left")
      sprite.x -= 100 * dt

    if tinto.input.keyDown("up")
      sprite.y -= 100 * dt

    if tinto.input.keyDown("down")
      sprite.y += 100 * dt

  canvas.draw ->
    canvas.clear()
    sprite.draw()
