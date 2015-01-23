React = require('react')
store = require('flux/stores/application')

SettingsForm = React.createClass
  displayName: 'SettingsForm'
  checkboxOnChange: (storeKey)->
    (event)->
      state = {}
      state[storeKey] = event.target.checked
      store.setState(state)
  render: ->
    <form id='game-settings-form' className='form-horizontal'>
      <fieldset>
        <div className='form-group'>
          <div className='text'>Show Completed Games?</div>
          <div className='checkbox checkbox-primary'>
            <label>
              <input type='checkbox' onChange={@checkboxOnChange('showBeatenGames')} defaultChecked={true}/>
            </label>
          </div>
        </div>

        <div className='form-group'>
          <div className='text'>Show Invalid/Unmatched Games?</div>
          <div className='checkbox checkbox-primary'>
            <label>
              <input type='checkbox' ref='showInvalidGames' onChange={@checkboxOnChange('showInvalidGames')} defaultChecked={true}/>
            </label>
          </div>
        </div>

        <div className='form-group'>
          <div className='text'>Order by length?</div>
          <div className='checkbox checkbox-primary'>
            <label>
              <input type='checkbox' ref='orderByLength' onChange={@checkboxOnChange('orderByLength')}/>
            </label>
          </div>
        </div>

        <div className='form-group'>
          <label htmlFor='titleFilter' className='text'>Filter games by title text</label>
          <input type='text' className='form-control' id='titleFilter' ref='titleFilter' />
        </div>
      </fieldset>
    </form>

module.exports = SettingsForm
