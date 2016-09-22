@Exercises = React.createClass
  getInitialState: ->
    exercises: @props.exercises

  getDefaultProps: ->
    exercises: []

  updateExercise: (exercise, data) ->
    index = @state.exercises.indexOf exercise
    exercises = React.addons.update(@state.exercises, { $splice: [[index, 1, data]]})
    @props.handleExerciseRefresh exercises
    @replaceState exercises: exercises

  addExercise: (exercise) ->
    exercises = React.addon.update(@state.exercises, { $push: [exercise] })
    @props.handleExerciseRefresh exercises
    @setState exercises: exercises

  deleteExercise: (exercise) ->
    index = @state.exercises.indexOf exercise
    exercises = React.addons.update(@state.exercises, { $splice: [[index, 1]] })
    @props.handleExerciseRefresh exercises
    @replaceState exercises: exercises

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
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for exercise in @state.exercises
            React.createElement Exercise, key: exercise.id, exercise: exercise, handleDeleteExercise: @deleteExercise, handleEditExercise: @updateExercise
