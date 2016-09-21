@Food = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, dateFormat(@props.food.created_at)
      React.DOM.td null, @props.food.name
      React.DOM.td null, @props.food.calories
