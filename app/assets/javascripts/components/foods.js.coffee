@Foods = React.createClass
  getInitialState: ->
    foods: @props.foods

  getDefaultProps: ->
    foods: []

  addFood: (food) ->
    foods = React.addons.update(@state.foods, { $push: [food] })
    @props.handleFoodRefresh foods
    @setState foods: foods

  updateFood: (food, data) ->
    index = @state.foods.indexOf food
    foods = React.addons.update(@state.foods, { $splice: [[index, 1, data]] })
    @props.handleFoodRefresh foods
    @replaceState foods: foods

  deleteFood: (food) ->
    index = @state.foods.indexOf food
    foods = React.addons.update(@state.foods, { $splice: [[index, 1]] })
    @props.handleFoodRefresh foods
    @replaceState foods: foods

  render: ->
    React.DOM.div
      className: 'foods'
      React.DOM.h2
        className: 'name'
        'Foods'
      React.createElement FoodForm, handleNewFood: @addFood
      React.DOM.hr null
      React.DOM.table
        className: "table table-bordered"
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, "Name"
            React.DOM.th null, "Calories"
            React.DOM.th null, "Actions"
        React.DOM.tbody null,
          for food in @state.foods
            React.createElement Food, key: food.id, food: food, handleDeleteFood: @deleteFood, handleEditFood: @updateFood
