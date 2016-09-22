@Exercises = React.createClass
  getInitialState: ->
    exercises: @props.data

  getDefaultProps: ->
    exercises: []

  addExercise: (exercise) ->
    exercises = @state.exercises.slice()
    exercises.push exercise
    @setState exercises: exercises
  render: ->
    React.DOM.div
      className: 'exercises'
      React.DOM.h2
        className: 'title'
        'Exercises'
      React.createElement ExerciseForm, handleNewExercise: @addExercise
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Calories Burned'
        React.DOM.tbody null,
          for exercise in @state.exercises
            React.createElement Exercise, key: exercise.id, exercise: exercise
