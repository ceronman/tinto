this.tinto = {}

class tinto.EventEmitter
  constructor: ->
    @callbacks = []

  call: ->
    for callback in @callbacks
      callback.apply null, arguments

  addCallback: (callback) ->
    @callbacks.push callback

  removeCallback: (callback) ->
    index = @callbacks.indexOf(callback)
    if index != -1
      @callbacks.splice index, 1