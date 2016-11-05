# app/assets/javascripts/components/expenses/expense_form.coffee

@ExpenseForm = React.createClass
  getInitialState: ->
    date: ''
    title: ''
    category_id: ''
    amount: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { expense: @state }, (data) =>
      $(this.refs.date).find('.datepicker').val('')
      $(this.refs.category).find('.selectpicker').val('')
      @props.handleNewExpense data
      @setState @getInitialState()
    , 'JSON'
  valid: ->
    @state.date && @state.title && @state.category_id && @state.amount
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group m-r-1'
        ref: 'date'
        React.createElement DatePicker,
          placeholder: 'Date',
          name: 'date',
          value: @state.date,
          handleOnChange: @handleChange
      React.DOM.div
        className: 'form-group m-r-1'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group m-r-1'
        ref: 'category'
        React.createElement Select,
          placeholder: 'Category',
          name: 'category_id',
          handleOnChange: @handleChange,
          getIconClass: getExpenseCategoryIcon,
          url: 'category/get_categories'
      React.DOM.div
        className: 'form-group m-r-1'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Amount'
          name: 'amount'
          value: @state.amount
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        React.DOM.i
          className: 'fa fa-plus fa-fw'
