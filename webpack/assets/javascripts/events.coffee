dispatcher = require('dispatcher')
gameActions = require('flux/actions/games')

games_channel = dispatcher.subscribe('games')
games_channel.bind('new_game', gameActions.newGame)

module.exports =
  games_channel: games_channel
