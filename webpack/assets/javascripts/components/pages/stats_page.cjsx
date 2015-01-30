# @cjsx React.DOM

React = require('react')
GamesLayout = require('components/games/layout')
gamesStore = require('flux/stores/games')

module.exports = React.createClass
  displayName: 'StatsPage'
  mixins: [gamesStore.mixin()]
  getStateFromStores: ->
    totalGames: @store.get('allGames').length
    completedGames: @store.get('allGames').filter((game)-> game.beaten).length
    playedGames: @store.get('allGames').filter((game)-> game.played).length
    timeToBeatUnplayed: @store.get('allGames')
                              .filter((game)-> !game.played)
                              .map((game)-> game.main_length)
                              .reduce((l, r)-> l + r)
  render: ->
    <GamesLayout>
      <p>Total games: {@state.totalGames}</p>
      <p>Completed games: {@state.completedGames}</p>
      <p>Played games: {@state.playedGames}</p>
      <p>Time to beat unplayed: {@state.timeToBeatUnplayed} hours</p>
    </GamesLayout>
