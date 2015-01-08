# @cjsx React.DOM 

React = require('react')
actions = require('flux/actions/user')
require('flux/stores/user')

HomePage = React.createClass
  displayName: 'HomePage'
  handleInput: (e)->
    if e.key == "Enter"
      actions.resolveUser(@refs.targetUserInput.getDOMNode().value)
  render: ->
    <div>
      <input type='text' onKeyPress={@handleInput} ref='targetUserInput' />
    </div>

module.exports = HomePage
