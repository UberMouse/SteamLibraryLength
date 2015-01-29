# @cjsx React.DOM

React = require('react')
Router = require('react-router-component')
Locations = Router.Locations
Location = Router.Location
NotFound = Router.NotFound

NotFoundHandler = require('components/pages/not_found')
StatsPage = require('components/pages/stats_page')
ViewGamesPage = require('components/pages/view_games')

module.exports = React.createClass
  displayName: "GamesRouter"
  render: ->
    # not sure why this is required, but the contexual routing doesn't work otherwise
    path = "/" + if(@props._?) then @props._[0] else ""
    <Locations path={path} contexual>
      <Location path="/stats" handler={StatsPage} />
      <Location path="/games" handler={ViewGamesPage} />
      <NotFound handler={NotFoundHandler} />
    </Locations>
