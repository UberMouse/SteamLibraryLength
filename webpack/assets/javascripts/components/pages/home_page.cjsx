# @cjsx React.DOM 

React = require('react')
userActions = require('flux/actions/user')
gameActions = require('flux/actions/games')
userStore = require('flux/stores/user')
gameStore = require('flux/stores/games')


LoadGames = React.createClass
  displayName: 'LoadGames'
  loadGames: ->
    gameActions.loadGames(@props.steamId)
  render: ->
    <div>
      <p>Your steam id is {@props.steamId}</p>
      <input type='submit' value='Load Games' onClick={@loadGames} />
    </div>

GamesLoading = React.createClass
  displayName: 'GamesLoading'
  render: ->
    <p>Game information is currently being retrieved. Progress {@props.loadedGames}/{@props.totalGames}</p>

Game = React.createClass
  displayName: 'Game'
  render: ->
    <tr>
      <td>{@props.game.name}</td>
      <td>{@props.game.main_length || 'N/A'}</td>
      <td>{@props.game.main_with_extras_length || 'N/A'}</td>
      <td>{@props.game.completionist_length || 'N/A'}</td>
    </tr>

DisplayGames = React.createClass
  displayName: 'DisplayGames'
  render: ->
    games = @props.games.map (game)->
      <Game game={game} key={game.app_id}/>
    <table>
      <thead>
        <tr>
          <td>Name</td>
          <td>Main/Coop Length</td>
          <td>Main + Extras/Versus Length</td>
          <td>Completionist Length</td>
         </tr>
      </thead>
      {games}
    </table>

CalculateLengths = React.createClass
  mixins: [gameStore.mixin()]
  displayName: 'CalculateLengths'
  getStateFromStores: ->
    games: @store.get('games')
    loading: @store.get('loading')
    loadProgress: @store.get('loadProgress')
  render: ->
    target = null
    if @state.games?.length
      target = <DisplayGames games={@state.games} />
    else
      target = <LoadGames steamId={@props.steamId} />

    gamesLoading = if(@state.loading) then <GamesLoading loadedGames={@state.loadProgress.loaded} totalGames={@state.loadProgress.total} /> else null
    <div>
      <div>{gamesLoading}</div>
      <div>{target}</div>
    </div>

EnterSteamInformation = React.createClass
  displayName: 'EnterSteamInformation'
  handleInput: (e)->
    if e.key == "Enter"
      userActions.resolveUser(@refs.targetUserInput.getDOMNode().value)
  render: ->
    <div>
      <p>Please enter your Steam vanity url or SteamID64</p>
      <input type='text' onKeyPress={@handleInput} ref='targetUserInput' />
    </div>

HomePage = React.createClass
  mixins: [userStore.mixin()]
  displayName: 'HomePage'
  getStateFromStores: ->
    steamId: userStore.state.get('steamId')
  render: ->
    target = null
    if @state.steamId?
      target = <CalculateLengths steamId={@state.steamId}/>
    else
      target = <EnterSteamInformation />

    <div>{target}</div>

module.exports = HomePage
