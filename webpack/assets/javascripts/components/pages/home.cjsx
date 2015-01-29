# @cjsx React.DOM 

React = require('react/addons')
userActions = require('flux/actions/user')
userStore = require('flux/stores/user')
Navigatable = require('react-router-component').NavigatableMixin

HomePage = React.createClass
  mixins: [userStore.mixin(), Navigatable]
  displayName: 'HomePage'
  getStateFromStores: ->
    steamId: @store.get('steamId')
  handleInput: (e)->
    if e.key == "Enter"
      userActions.resolveUser(@refs.targetUserInput.getDOMNode().value)
  componentWillMount: ->
    @store.onChange(@storeChangeCallback)
  componentWillUnmount: ->
    @store.offChange(@storeChangeCallback)
  storeChangeCallback: ->
    steamId = @store.get('steamId')
    if(steamId != null)
      @navigate("/#{steamId}/games")
  render: ->
    <div className='form-control-wrapper'>
      <input type='text' onKeyPress={@handleInput} ref='targetUserInput' className='form-control empty' placeholder="Enter your Steam vanity url or SteamID64"/>
    </div>

module.exports = HomePage
