# @cjsx React.DOM
React = require('react/addons')
gameActions = require('flux/actions/games')
gameStore = require('flux/stores/games')
userStore = require('flux/stores/user')
applicationStore = require('flux/stores/application')
Slider = require('components/slider')
GameSettingsForm = require('components/games/settings_form')
GamesLayout = require('components/games/layout')

GamesLoading = React.createClass
  displayName: 'GamesLoading'
  render: ->
    <h2>Game information is currently being retrieved. Progress {@props.loadedGames}/{@props.totalGames}</h2>

Game = React.createClass
  displayName: 'Game'
  render: ->
    game = @props.game
    classes = React.addons.classSet(
      'danger': !game.game_found_on_hltb
      'warning': game.invalid
    )
    beaten = if(game.beaten) then 'Yes' else 'No'
    if game.playtime == 0
      beaten = 'Unplayed'
    if game.invalid || game.main_length == 0
      beaten = 'N/A'
    <tr className={classes}>
      <td>{game.name}</td>
      <td>{game.main_length || 'N/A'}</td>
      <td>{game.main_with_extras_length || 'N/A'}</td>
      <td>{game.completionist_length || 'N/A'}</td>
      <td>{game.playtime} Hours</td>
      <td>{beaten}</td>
    </tr>

DisplayGames = React.createClass
  displayName: 'DisplayGames'
  render: ->
    games = @props.games.map (game)->
                          <Game game={game} key={game.app_id}/>
    <table className='table table-striped table-hover'>
      <thead>
        <tr>
          <td>Name</td>
          <td>Main/Coop Length</td>
          <td>Main + Extras/Versus Length</td>
          <td>Completionist Length</td>
          <td>Steam Playtime</td>
          <td>Completed (Guesstimate)</td>
         </tr>
      </thead>
      <tbody>
        {games}
      </tbody>
    </table>

ViewGames = React.createClass
  mixins: [gameStore.mixin()]
  displayName: 'ViewGames'
  getStateFromStores: ->
    games: @store.get('games')
    loading: @store.get('loading')
    loadProgress: @store.get('loadProgress')
  componentWillMount: ->
    unless applicationStore.get('kickedOffGamesLoad')
      gameActions.loadGames(userStore.get('steamId'))
      applicationStore.setState(kickedOffGamesLoad: true)
  render: ->
    loading = if(@state.loading) then <GamesLoading loadedGames={@state.loadProgress.loaded} totalGames={@state.loadProgress.total} /> else null

    <GamesLayout>
      <Slider>
        <GameSettingsForm />
      </Slider>
      {loading}
      <DisplayGames games={@state.games} />
    </GamesLayout>

module.exports = ViewGames
