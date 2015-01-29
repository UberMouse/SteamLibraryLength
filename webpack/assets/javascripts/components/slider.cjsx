React = require('react/addons')

Foo = React.createClass
  displayName: 'Slider'
  getInitialState: ->
    open: false
  handleClick: ->
    @setState(open: !@state.open)
  render: ->
    sliderClasses = React.addons.classSet
      'open': @state.open
    toggleContent = if(@state.open) then '^^^' else 'Settings'
    <div id='slider' className={sliderClasses}>
      <div id='slider-content' className='well well-sm'>
        {@props.children}
      </div>
      <div id='slider-toggle' className='btn btn-primary' onClick={@handleClick}>
        <span>{toggleContent}</span>
      </div>
    </div>

module.exports = Foo
