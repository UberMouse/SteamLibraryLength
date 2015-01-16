# @cjsx React.DOM 
require('events')
React = require('react')
Router = require('react-router-component')
Locations = Router.Locations
Location = Router.Location
NotFound = Router.NotFound

HomePage = require('components/pages/home')
ViewGamesPage = require('components/pages/view_games')

NotFoundHandler = React.createClass
  render: ->
    <h1>Not found</h1>

App = React.createClass
  displayName: 'SteamLibraryLength'
  render: ->
    <Locations path={@props.path}>
      <Location path="/" handler={HomePage} />
      <Location path="/games" handler={ViewGamesPage} />
      <NotFound handler={NotFoundHandler} />
    </Locations>

window.App = App
module.exports = App
