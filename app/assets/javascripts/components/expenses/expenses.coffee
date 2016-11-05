# app/assets/javascripts/components/expenses/expenses.coffee

@Expenses = React.createClass
  getInitialState: ->
    expenses: @props.data
  getDefaultProps: ->
    expenses: []
  addExpense: (expense) ->
    expenses = React.addons.update(@state.expenses, { $push: [expense] })
    @setState expenses: expenses
  deleteExpense: (expense) ->
    index = @state.expenses.indexOf expense
    expenses = React.addons.update(@state.expenses, { $splice: [[index, 1]] })
    @replaceState expenses: expenses
  updateExpense: (expense, data) ->
      index = @state.expenses.indexOf expense
      expenses = React.addons.update(@state.expenses, { $splice: [[index, 1, data]] })
      @replaceState expenses: expenses
  render: ->
    React.DOM.div
      className: 'expenses'
      React.createElement ExpenseForm, handleNewExpense: @addExpense
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered table-striped table-hover'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Category'
            React.DOM.th null, 'Amount ($)'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for expense in @state.expenses
            React.createElement Expense,
              key: expense.id,
              expense: expense,
              handleDeleteExpense: @deleteExpense,
              handleEditExpense: @updateExpense
      if @state.expenses.length == 0
        React.DOM.div
          className: 'text-xs-center'
          'No expenses registered'
