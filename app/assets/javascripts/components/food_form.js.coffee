@FoodForm = React.createClass
  getInitialState: ->
    name: ''
    calories: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { food: @state }, (data) =>
      @props.handleNewFood data
      @setState @getInitialState()
    , 'JSON'

  valid: ->
    @state.name && @state.calories
    
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Calories'
          name: 'calories'
          value: @state.calories
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-success'
        disabled: !@valid()
        'Add Food'
