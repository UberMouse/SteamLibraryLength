# @cjsx React.DOM 

React = require('react')
actions = require('flux/actions/user')
userStore = require('flux/stores/user')

CalculateLengths = React.createClass
  displayName: 'CalculateLengths'
  render: ->
    <p>Your steam id is {@props.steamId}</p>

EnterSteamInformation = React.createClass
  displayName: 'EnterSteamInformation'
  handleInput: (e)->
    if e.key == "Enter"
      actions.resolveUser(@refs.targetUserInput.getDOMNode().value)
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
    if @state.steamId?
      <CalculateLengths steamId={@state.steamId}/>
    else
      <EnterSteamInformation />

module.exports = HomePage
