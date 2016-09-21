@Food = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: this.refs.name.value
      calories: this.refs.calories.value
    $.ajax
      method: "PUT"
      url: "/foods/#{ @props.food.id }"
      dataType: 'JSON'
      data:
        food: data
      success: (data) =>
        @setState edit: false
        @props.handleEditFood @props.food, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/foods/#{ @props.food.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteFood @props.food

  foodRow: ->
    React.DOM.tr null,
      React.DOM.td null, dateFormat(@props.food.created_at)
      React.DOM.td null, @props.food.name
      React.DOM.td null, @props.food.calories
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

  foodForm: ->
    React.DOM.tr null,
      React.DOM.td null,  dateFormat(@props.food.created_at)
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.food.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.food.calories
          ref: 'calories'
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
      @foodForm()
    else
      @foodRow()
