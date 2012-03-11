window.onload = () ->
  console.log('init')

  canvas = new tinto.GameCanvas('gamecanvas')

  label = new tinto.text.Label
    text: 'Hello World'
    x: 10, y: 100
    color: 'red'
    font: 'Bold 40pt Arial'

  canvas.draw () ->
    canvas.clear()
    label.draw()

  speed = 20
  canvas.update (dt) ->
    label.x += dt * speed
    if label.x > 500 or label.x <0
      speed *= -1

