# app/assets/javascripts/components/dashboard/chart_widget.coffee

@ChartWidget = React.createClass
  getDefaultProps: ->
    chartShowScale: false,
    cssClass: ''
  render: ->
    React.DOM.div
      className: @props.cssClass
      React.DOM.div
        className: 'card'
        React.DOM.div
          className: 'card-header'
          React.DOM.div
            className: 'card-title'
            @props.title
        React.DOM.div
          className: 'card-body'
          if @props.chartData.datasets.length == 1 &&
          @props.chartData.datasets[0].data.length == 0
            React.DOM.div
              className: 'text-xs-center'
              'No data found'
          else
            React.DOM.canvas
              id: @props.id
  componentDidMount: ->
    ctx = document.getElementById(@props.id);
    if ctx
      myChart = new Chart(ctx, {
        showScale: @props.chartShowScale,
        type: @props.chartType,
        data: @props.chartData
      });
