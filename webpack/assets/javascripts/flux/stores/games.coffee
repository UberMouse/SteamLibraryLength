flux = require('react-flux')
constants = require('flux/constants/games')

store = flux.createStore {
  getInitialState: ->
    games: []
    loading: false
    loadProgress:
      loaded: 0
      total: 0
}, [
  [constants.LOAD_INIT_SUCCESS, (payload)->
    @setState {
      loading: payload.games.length < payload.total_games
      games: payload.games
      loadProgress:
        total: payload.total_games
        loaded: payload.games.length
    }
  ],
  [constants.NEW_SUCCESS, (payload)->
    games = @get('games')
    games.push(payload)
    @setState {
      games: games
      loadProgress:
        loaded: @get('loadProgress.loaded') + 1
    }
  ],
]

window.gameStore = store
module.exports = store
