# @cjsx React.DOM

React = require('react')
GamesLayout = require('components/games/layout')
gamesStore = require('flux/stores/games')

module.exports = React.createClass
  displayName: 'StatsPage'
  mixins: [gamesStore.mixin()]
  getStateFromStores: ->
    games = @store.get('allGames')
    # So that reduce doesn't crash before the data is loaded
    unless(games.length)
      games = [0, 0]
    totalGames: games.length
    completedGames: games.filter((game)-> game.beaten).length
    playedGames: games.filter((game)-> game.played).length
    timeToBeatUnplayed: games.filter((game)-> !game.played)
                             .map((game)-> game.main_length)
                             .reduce((l, r)-> l + r)
  render: ->
    <GamesLayout>
      <p>Total games: {@state.totalGames}</p>
      <p>Completed games: {@state.completedGames}</p>
      <p>Played games: {@state.playedGames}</p>
      <p>Time to beat unplayed: {@state.timeToBeatUnplayed} hours</p>
    </GamesLayout>
