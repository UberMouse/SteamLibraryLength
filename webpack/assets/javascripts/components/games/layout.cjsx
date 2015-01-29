# @cjsx React.DOM

React = require('react/addons')
Router = require('react-router-component')
Link = Router.Link


module.exports = React.createClass
  displayName: 'GamesLayout'
  mixins: [Router.NavigatableMixin]
  render: ->
    routes = [{path: '/stats', name: 'Stats'}, {path: '/games', name: 'Games List'}].map (route, index)=>
      classes = React.addons.classSet('active': @getPath() == route.path)
      <li className={classes} key={index}><Link href={route.path}>{route.name}</Link></li>

    <div id='games-layout'>
      <div className="navbar navbar-default">
       <div className="navbar-header">
         <button type="button" className="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
           <span className="icon-bar"></span>
           <span className="icon-bar"></span>
           <span className="icon-bar"></span>
         </button>
         <span className="navbar-brand">Steam Library Length</span>
       </div>
       <div className="navbar-collapse collapse navbar-responsive-collapse">
         <ul className="nav navbar-nav">
          {routes}
         </ul>
       </div>
      </div>
      {@props.children}
    </div>
