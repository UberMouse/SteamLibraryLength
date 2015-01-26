React = require('react')
store = require('flux/stores/application')

SettingsForm = React.createClass
  displayName: 'SettingsForm'
  onChange: (storeKey, valueInput)->
    (event)->
      state = {}
      state[storeKey] = if(valueInput) then event.target.value else event.target.checked
      store.setState(state)
  render: ->
    <form id='game-settings-form' className='form-horizontal'>
      <fieldset>
        <div className='form-group'>
          <div className='text'>Show Completed Games?</div>
          <div className='checkbox checkbox-primary'>
            <label>
              <input type='checkbox' onChange={@onChange('showBeatenGames')} defaultChecked={true}/>
            </label>
          </div>
        </div>

        <div className='form-group'>
          <div className='text'>Show Invalid/Unmatched Games?</div>
          <div className='checkbox checkbox-primary'>
            <label>
              <input type='checkbox' onChange={@onChange('showInvalidGames')} defaultChecked={true}/>
            </label>
          </div>
        </div>

        <div className='form-group'>
          <div className='text'>Order by length?</div>
          <div className='checkbox checkbox-primary'>
            <label>
              <input type='checkbox' onChange={@onChange('orderByLength')} defaultChecked={true}/>
            </label>
          </div>
        </div>

        <div className='form-group'>
          <label htmlFor='titleFilter' className='text'>Filter games by title text</label>
          <input type='text' className='form-control' id='titleFilter' onChange={@onChange('gameTitleFilter', true)}/>
        </div>
      </fieldset>
    </form>

module.exports = SettingsForm
