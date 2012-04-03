class GameCanvas

  constructor: (canvasID, options) ->
    this.canvas = document.getElementById(canvasID)
    options = options ? {}
    this.canvas.width = options.width ? 640
    this.canvas.height = options.height ? 480
    this.canvas.style.backgroundColor = options.background ? 'black'
    this.context2D = this.canvas.getContext('2d')

    tinto.setActiveCanvas(this)

    this.width = this.canvas.width
    this.height = this.canvas.height

    this.drawCallbacks = []
    this.updateCallbacks = []

    draw = () =>
      for callback in this.drawCallbacks
        callback()

    oldTimestamp = new Date().getTime()
    update = () =>
      newTimestamp = new Date().getTime()
      dt = (newTimestamp - oldTimestamp) / 1000
      oldTimestamp = newTimestamp
      for callback in this.updateCallbacks
        callback(dt)
      draw()

    tinto.resource.loaded () ->
      window.setInterval(update, 1000/60.0)

    tinto.resource.check()
    tinto.input.installKeyboardCallbacks()

  draw: (callback) ->
    this.drawCallbacks.push(callback)

  update: (callback) ->
    this.updateCallbacks.push(callback)

  clear: () ->
    this.context2D.clearRect(0, 0, this.width, this.height)

  preserveContext: (drawFunction) ->
    this.context2D.save()
    drawFunction(this.context2D)
    this.context2D.restore()


this.tinto =

  GameCanvas: GameCanvas

  setActiveCanvas: (gameCanvas) ->
    this.activeCanvas = gameCanvas
