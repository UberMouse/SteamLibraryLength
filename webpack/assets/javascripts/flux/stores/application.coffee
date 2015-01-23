flux = require('react-flux')

ApplicationStore = flux.createStore {
  getInitialState: ->
    kickedOffGamesLoad: false
    showBeatenGames: true
    showInvalidGames: true
    orderByLength: false
    gameTitleFilter: ''
}, []

module.exports = ApplicationStore
