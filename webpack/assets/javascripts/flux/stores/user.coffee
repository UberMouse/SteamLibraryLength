flux = require('react-flux')
constants = require('flux/constants/user')

module.exports = flux.createStore {
  getInitialState: ->
    steamId: null
}, [
  [constants.RESOLVE_SUCCESS, (payload)->
    @setState {
      steamId: payload.steam_id
    }
  ],
]
