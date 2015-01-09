flux = require('react-flux')
constants = require('flux/constants/user')
dispatcher = require('dispatcher')

module.exports = flux.createActions
  resolveUser: [constants.RESOLVE, (vanityUrl)->
    dispatcher.triggerAsync('user.resolve', {vanity_url: vanityUrl})
  ]
