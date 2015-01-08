flux = require('react-flux')
constants = require('flux/constants/user')

module.exports = flux.createStore {
  getInitialState: ->
    steamId: null
}, [
  [constants.RESOLVE_SUCCESS, (payload)->
    console.log('Resolved user to', payload.steamId)
  ],
]
