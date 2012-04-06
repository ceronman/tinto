window.onload = ->
  canvas = new tinto.canvas.GameCanvas('gamecanvas')

  tinto.resource.loadAll()

  label = new tinto.text.Label
    text: "Press any key"
    x: canvas.width /2
    y: canvas.height/2
    alignment: "center"
    color: "white"
    font: "Bold 40pt Arial"

  tinto.input.keypressed (keyCode) ->
    keyName = tinto.input.keyName keyCode
    label.text = "Pressed [#{keyName}]"
    label.color = "blue"

  tinto.input.keyreleased (keyCode) ->
    keyName = tinto.input.keyName keyCode
    label.text = "Press any key"
    label.color = "white"

  canvas.draw ->
    canvas.clear()
    label.draw()
