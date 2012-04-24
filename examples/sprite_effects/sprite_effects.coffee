window.onload = () ->
  canvas = new tinto.canvas.GameCanvas('gamecanvas')

  sprite = new tinto.sprite.Sprite
    image: tinto.resource.image('../resources/tinto.png')
    centerX: canvas.width / 2
    centerY: canvas.height / 2

  tinto.resource.loadAll()

  scaleSpeed = 0.05
  rotateSpeed = -2

  canvas.update () ->
    sprite.rotation += rotateSpeed
    if sprite.rotation >= 360 or sprite.rotation < 0
      rotateSpeed *= -1

    sprite.scale += scaleSpeed
    if sprite.scale >= 5.0 or sprite.scale <= 0.2
      scaleSpeed *= -1


  canvas.draw () ->
    canvas.clear()
    sprite.draw()
