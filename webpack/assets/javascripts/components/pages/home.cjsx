# @cjsx React.DOM 

React = require('react/addons')
Link = require('react-router-component').Link
userActions = require('flux/actions/user')
userStore = require('flux/stores/user')


LoadGames = React.createClass
  displayName: 'LoadGames'
  render: ->
    <div>
      <p>Your steam id is {@props.steamId}</p>
      <Link href='/games'>Load Games</Link>
    </div>

EnterSteamInformation = React.createClass
  displayName: 'EnterSteamInformation'
  handleInput: (e)->
    if e.key == "Enter"
      userActions.resolveUser(@refs.targetUserInput.getDOMNode().value)
  render: ->
    <div className='form-control-wrapper'>
      <input type='text' onKeyPress={@handleInput} ref='targetUserInput' className='form-control empty' placeholder="Enter your Steam vanity url or SteamID64"/>
    </div>

HomePage = React.createClass
  mixins: [userStore.mixin()]
  displayName: 'HomePage'
  getStateFromStores: ->
    steamId: userStore.state.get('steamId')
  render: ->
    target = null
    if @state.steamId?
      target = <LoadGames steamId={@state.steamId} />
    else
      target = <EnterSteamInformation />

    <div>{target}</div>

module.exports = HomePage
