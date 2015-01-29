# @cjsx React.DOM 
require('events')
React = require('react')
Router = require('react-router-component')
Locations = Router.Locations
Location = Router.Location
NotFound = Router.NotFound

HomePage = require('components/pages/home')
GamesRouter = require('components/games_router')

NotFoundHandler = require('components/pages/not_found')

App = React.createClass
  displayName: 'SteamLibraryLengthRouter'
  render: ->
    <Locations path={@props.path}>
      <Location path="/" handler={HomePage} />
      <Location path="/:steamId(/*)" handler={GamesRouter} />
      <NotFound handler={NotFoundHandler} />
    </Locations>

window.App = App
module.exports = App
