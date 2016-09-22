@Main = React.createClass
  getInitialState: ->
    foods: @props.foods
    exercises: @props.exercises

  getDefaultProps: ->
    foods: []
    exercises: []

  caloriesTotal: ->
    foods = @state.foods
    foods.reduce ((prev, curr) ->
      prev + curr.calories
    ), 0

  burnedCalories: ->
    exercises = @state.exercises
    exercises.reduce ((prev, curr) ->
      prev + curr.burned_calories
    ), 0

  netCalories: ->
    @caloriesTotal() - @burnedCalories()

  refreshExerciseState: (exercises) ->
    @setState exercises: exercises

  refreshFoodState: (foods) ->
    @setState foods: foods

  render: ->
    React.DOM.div
      className: 'row'
      React.createElement TotalCalories, type: 'danger', calories: @caloriesTotal(), text: 'Gross Caloric Intake'
      React.createElement TotalCalories, type: 'success', calories: @netCalories(), text: 'Net Caloric Intake'
      React.createElement TotalCalories, type: 'info', calories: @burnedCalories(), text: 'Burned Calories'
      React.DOM.div
        className: 'col-sm-6'
        React.createElement Foods, foods: @state.foods, handleFoodRefresh: @refreshFoodState
      React.DOM.div
        className: 'col-sm-6'
        React.createElement Exercises, exercises: @state.exercises, handleExerciseRefresh: @refreshExerciseState
