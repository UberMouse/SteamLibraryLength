dispatcher = new WebSocketRails('localhost:3000/websocket')
Promise = require('bluebird')

# The default trigger is also async, but this naming is line with bluebirds promisification
dispatcher.triggerAsync = (eventName, data)->
  new Promise (resolve, reject)->
    console.log("Triggering #{eventName}")

    tappedResolve = (args)->
      console.log("Calling resolve for event #{eventName}")
      resolve(args)
    tappedReject = (args)->
      console.log("Calling reject for event #{eventName}")
      reject(args)

    dispatcher.trigger(eventName, data, tappedResolve, tappedReject)


module.exports = dispatcher
