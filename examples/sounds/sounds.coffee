window.onload = ->
  canvas = new tinto.canvas.GameCanvas('gamecanvas')

  bounce = tinto.resource.sound('../resources/bounce.ogg')
  goal = tinto.resource.sound('../resources/goal.ogg')

  rect =
    x: canvas.width / 2
    y: canvas.height / 2
    width: 10
    height: 20
    color: 'red'
    speed_x: 200
    speed_y: 200

    draw: ->
      canvas.context2D.fillStyle = @color
      canvas.context2D.fillRect @x, @y, @width, @height

    update: (dt) ->
      @x += @speed_x * dt
      @y += @speed_y * dt

      if @x > canvas.width - @width
        @x = canvas.width - @width
        @speed_x *= -1
        bounce.play()

      if @x < 0
        @x = 0
        @speed_x *= -1
        bounce.play()

      if @y > canvas.height - @height
        @y = canvas.height - @height
        @speed_y *= -1
        goal.play()

      if @y < 0
        @y = 0
        @speed_y *= -1
        goal.play()

  tinto.resource.loadAll()

  canvas.update (dt) ->
    canvas.clear()
    rect.update dt

  canvas.draw ->
    rect.draw()
