flux = require('react-flux')
constants = require('flux/constants/games')
dispatcher = require('dispatcher')

module.exports = flux.createActions
  loadGames: [constants.LOAD_INIT, (steamId)->
    dispatcher.triggerAsync('games.load', {steam_id: steamId})
  ]
  newGame: [constants.NEW, (game)->
    console.log('new game', game)
    game
  ]
