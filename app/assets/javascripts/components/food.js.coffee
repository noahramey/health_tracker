@Food = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/foods/#{ @props.food.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteFood @props.food

  render: ->
    React.DOM.tr null,
      React.DOM.td null, dateFormat(@props.food.created_at)
      React.DOM.td null, @props.food.name
      React.DOM.td null, @props.food.calories
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          React.DOM.i
            className: 'glyphicon glyphicon-trash'
