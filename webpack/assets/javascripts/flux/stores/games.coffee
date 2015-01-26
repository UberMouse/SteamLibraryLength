flux = require('react-flux')
constants = require('flux/constants/games')
game = require('models/game')
applicationStore = require('flux/stores/application')

store = flux.createStore {
  getInitialState: ->
    games: []
    allGames: []
    loading: false
    loadProgress:
      loaded: 0
      total: 0
}, [
  [constants.LOAD_INIT_SUCCESS, (payload)->
    @setState {
      loading: payload.games.length < payload.total_games
      allGames: payload.games.map (json)-> game.fromJSON(json)
      loadProgress:
        total: payload.total_games
        loaded: payload.games.length
    }
  ],
  [constants.NEW_SUCCESS, (payload)->
    games = @get('games')
    games.push(game.fromJSON(payload))
    loaded = @get('loadProgress.loaded') + 1
    @setState {
      allGames: games
      loading: loaded < @get('loadProgress.total')
      loadProgress:
        loaded: loaded
    }
  ],
]
filterGames =
  _filter: (game)->
    if(game.name.toLowerCase().indexOf(@state.gameTitleFilter.toLowerCase()) == -1)
      return false
    if(game.invalid && !@state.showInvalidGames)
      return false
    if(game.beaten && !@state.showBeatenGames)
      return false

    true
  _order: (left, right)->
    byLength = (left, right)->
      if(left.main_length > right.main_length)
        return -1
      if(left.main_length < right.main_length)
        return 1
      return 0
    alphabetically = (left, right)->
      if(left.name > right.name)
        return 1
      if(left.name < right.name)
        return -1
      return 0
    if(@state.orderByLength)
      byLength(left, right)
    else
      alphabetically(left, right)
  call: (games, state)->
    @state = state
    games.filter(@_filter.bind(this))
         .sort(@_order.bind(this))

# This is disgusting
storeOnChange = ()->
  state =
    gameTitleFilter: applicationStore.get('gameTitleFilter')
    showBeatenGames: applicationStore.get('showBeatenGames')
    showInvalidGames: applicationStore.get('showInvalidGames')
    orderByLength: applicationStore.get('orderByLength')
  # Hack to get around the fact that mergeDeep in immutable-js merges arrays (Gotta go deeper) and I cannot find a way to prevent that
  storeState = store.state.toJS()
  storeState.games = filterGames.call(store.get('allGames'), state)
  store.replaceState(storeState)

#todo figure out better way of doing this. If the application store changes it will trigger a double refresh since it will also trigger the store onchange event
applicationStore.onChange storeOnChange
store.onChange storeOnChange

window.gameStore = store
module.exports = store
