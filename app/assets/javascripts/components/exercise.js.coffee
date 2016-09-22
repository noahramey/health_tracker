@Exercise = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: this.refs.name.value
      burned_calories: this.refs.burned_calories.value
    $.ajax
      method: "PUT"
      url: "/exercises/#{@props.exercise.id}"
      dataType: 'JSON'
      data:
        exercise: data
      success: (data) =>
        @setState edit: false
        @props.handleEditExercise @props.exercise, data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/exercises/#{ @props.exercise.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteExercise @props.exercise

  exerciseRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.exercise.name
      React.DOM.td null, @props.exercise.burned_calories
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          React.DOM.i
            className: 'glyphicon glyphicon-pencil'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          React.DOM.i
            className: 'glyphicon glyphicon-trash'

  exerciseForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.exercise.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.exercise.burned_calories
          ref: 'burned_calories'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-success'
          onClick: @handleEdit
          React.DOM.i
            className: 'glyphicon glyphicon-ok'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          React.DOM.i
            className: 'glyphicon glyphicon-remove'

  render: ->
    if @state.edit
      @exerciseForm()
    else
      @exerciseRow()
