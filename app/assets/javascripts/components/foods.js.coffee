@Foods = React.createClass
  getInitialState: ->
    foods: @props.data

  getDefaultProps: ->
    foods: []

  addFood: (food) ->
    foods = @state.foods.slice()
    foods.push food
    @setState foods: foods

  caloriesTotal: ->
    foods = @state.foods
    foods.reduce ((prev, curr) ->
      prev + curr.calories
    ), 0

  deleteFood: (food) ->
    foods = @state.foods.slice()
    index = foods.indexOf food
    foods.splice index, 1
    @replaceState foods: foods

  render: ->
    React.DOM.div
      className: 'foods'
      React.DOM.h2
        className: 'name'
        'Foods'
      React.DOM.div
        className: 'row'
        React.createElement TotalCalories, type: 'info', calories: @caloriesTotal(), text: 'Gross Caloric Intake'
      React.createElement FoodForm, handleNewFood: @addFood
      React.DOM.hr null
      React.DOM.table
        className: "table table-bordered"
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, "Date"
            React.DOM.th null, "Name"
            React.DOM.th null, "Calories"
            React.DOM.th null, "Actions"
        React.DOM.tbody null,
          for food in @state.foods
            React.createElement Food, key: food.id, food: food, handleDeleteFood: @deleteFood
