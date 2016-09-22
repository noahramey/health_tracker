@Exercise = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.exercise.name
      React.DOM.td null, @props.exercise.burned_calories
