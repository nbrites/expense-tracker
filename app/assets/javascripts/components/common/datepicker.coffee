# app/assets/javascripts/components/common/datepicker.coffee

@DatePicker = React.createClass
  openDatePicker: ->
    $(@refs[@props.name]).datepicker('show')
  render: ->
    React.DOM.div
      className: 'input-group date'
      React.DOM.input
        type: 'text'
        className: 'form-control datepicker'
        placeholder: @props.placeholder
        name: @props.name
        value: @props.date
        onChange: @props.handleOnChange
        ref: @props.name
      React.DOM.span
        className: 'input-group-addon'
        onClick: @openDatePicker
        React.DOM.i
          className: 'fa fa-calendar fa-fw'
  setValue: (val) ->
    $(@refs[@props.name]).val(val);
  componentDidMount: ->
    self = this
    options =
      autoclose: true,
      todayHighlight: true,
      orientation: 'bottom left',
      format: 'dd/mm/yyyy'
    if @props.handleOnChange
      $(@refs[@props.name]).datepicker(options)
                            .on changeDate: (e) -> self.props.handleOnChange(e)
    else
      $(@refs[@props.name]).datepicker(options)
    if @props.defaultValue
      this.setValue @props.defaultValue
