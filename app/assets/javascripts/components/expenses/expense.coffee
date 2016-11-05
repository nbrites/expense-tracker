# app/assets/javascripts/components/expenses/expense.coffee

@Expense = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/expenses/#{ @props.expense.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteExpense @props.expense
  handleEdit: (e) ->
    e.preventDefault()
    data =
      date: $(this.refs.date).find('.datepicker').val()
      title: @refs.title.value
      category_id: $(@refs.category).find('.selectpicker').val()
      amount: @refs.amount.value
    $.ajax
      method: 'PUT'
      url: "/expenses/#{ @props.expense.id }"
      dataType: 'JSON'
      data:
        expense: data
      success: (data) =>
        @setState edit: false
        @props.handleEditExpense @props.expense, data
  expenseEdit: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.div
          className: 'form-group'
          ref: 'date'
          React.createElement DatePicker,
            placeholder: 'Date',
            name: 'datepicker',
            value: @state.date,
            defaultValue: @props.expense.date
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.expense.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.div
          className: 'form-group'
          ref: 'category'
          React.createElement Select,
            placeholder: 'Category',
            name: 'category_id',
            getIconClass: getExpenseCategoryIcon,
            url: 'category/get_categories',
            defaultValue: @props.expense.category.id
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.expense.amount
          ref: 'amount'
      React.DOM.td null,
        React.DOM.div
          className: 'text-xs-center'
          React.DOM.a
            className: 'btn btn-success m-r-1'
            onClick: @handleEdit
            React.DOM.i
              className: 'fa fa-floppy-o fa-fw'
          React.DOM.a
            className: 'btn btn-secondary'
            onClick: @handleToggle
            React.DOM.i
              className: 'fa fa-times fa-fw'
  expenseReadOnly: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.span
          @props.expense.date
      React.DOM.td null,
        React.DOM.span
          @props.expense.title
      React.DOM.td null,
        React.DOM.span
          @props.expense.category.description
        React.DOM.i
          className: getExpenseCategoryIcon(@props.expense.category.code) + ' pull-right'
      React.DOM.td null,
        if @props.expense.amount > 0
          React.DOM.div
            className: 'text-success text-xs-right'
            amountFormat(@props.expense.amount)
        else
          React.DOM.div
            className: 'text-danger text-xs-right'
            amountFormat(@props.expense.amount)
      React.DOM.td null,
        React.DOM.div
          className: 'text-xs-center'
          React.DOM.a
            className: 'btn btn-secondary m-r-1'
            onClick: @handleToggle
            React.DOM.i
              className: 'fa fa-pencil fa-fw'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            React.DOM.i
              className: 'fa fa-trash fa-fw'
  render: ->
    if @state.edit
      @expenseEdit()
    else
      @expenseReadOnly()
