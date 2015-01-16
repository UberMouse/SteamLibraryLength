flux = require('react-flux')

ApplicationStore = flux.createStore {
  getInitialState: ->
    kickedOffGamesLoad: false
}, []

module.exports = ApplicationStore
