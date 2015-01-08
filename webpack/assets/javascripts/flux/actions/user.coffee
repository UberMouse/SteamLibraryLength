flux = require('react-flux')
constants = require('flux/constants/user')
dispatcher = require('dispatcher')
Promise = require('bluebird')

module.exports = flux.createActions
  resolveUser: [constants.RESOLVE, (userInfo)->
    dispatcher.triggerAsync('user.resolve', {userInfo: userInfo})
  ]
