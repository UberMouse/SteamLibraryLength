dispatcher = new WebSocketRails('localhost:3000/websocket')
Promise = require('bluebird')

# The default trigger is also async, but this naming is line with bluebirds promisification
dispatcher.triggerAsync = (eventName, data)->
  new Promise (resolve, reject)->
    dispatcher.trigger(eventName, data, resolve, reject)

module.exports = dispatcher
