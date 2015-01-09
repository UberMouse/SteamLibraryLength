flux = require('react-flux')
constants = require('flux/constants/games')

store = flux.createStore {
  getInitialState: ->
    games: []
    loading: false
    loadProgress:
      loaded: 0
      total: 0
      games: []
}, [
  [constants.LOAD_INIT_SUCCESS, (payload)->
    @setState {
      loading: true
      games: @state.get('games').concat(payload.games)
      loadProgress:
        total: payload.total_games
        loaded: payload.games.length
    }
  ],
  [constants.NEW_SUCCESS, (payload)->
    @setState {
      games: @state.get('games').push(payload.game)
      loadProgress:
        loaded: @state.get('loadProgress.loaded') + 1
    }
  ],
]

window.gameStore = store
module.exports = store
