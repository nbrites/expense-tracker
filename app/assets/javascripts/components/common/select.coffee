# app/assets/javascripts/components/common/select.coffee

@Select = React.createClass
  getInitialState: ->
    options: []
  render: ->
    React.DOM.select
      className: 'selectpicker'
      title: @props.placeholder
      name: @props.name
      onChange: @props.handleOnChange
      ref: @props.name
      if @state.options.length > 0
        for opt, index in @state.options
          React.DOM.option
            key: index
            value: opt.id
            'data-content': opt.description + '<i class="' +
                                                (if @props.getIconClass
                                                then @props.getIconClass(opt.code)
                                                else opt.description) +
                                                ' pull-right"></i>'
  setValue: (val) ->
    $(@refs[@props.name]).selectpicker('val', val);
  componentDidMount: ->
    $.get @props.url, (data) =>
      @replaceState options: data
  componentDidUpdate: ->
    $(@refs[@props.name]).selectpicker('refresh')
    if @props.defaultValue
      this.setValue @props.defaultValue
