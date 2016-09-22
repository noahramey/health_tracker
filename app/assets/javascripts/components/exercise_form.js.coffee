@ExerciseForm = React.createClass
  getInitialState: ->
    name: ''
    burned_calories: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name}": e.target.value

  valid: ->
    @state.name && @state.burned_calories

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/exercises', { exercise: @state }, (data) =>
      @props.handleNewExercise data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Calories Burned'
          name: 'burned_calories'
          value: @state.burned_calories
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        "Add exercise"
