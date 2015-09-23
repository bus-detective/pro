import Ember from 'ember';

export default Ember.Component.extend({
  numberData: Ember.computed(function(){
    return {
      labels: ["9/12/15", "9/13/15", "9/14/15", "9/15/15", "9/16/15","9/17/15","9/18/15"],
      datasets: [{
        label: "Male",
        fillColor: "rgba(0,0,0,0)",
        strokeColor: "#005F9B",
        data: [6500, 5900, 8000, 8400, 7500, 5800, 8000]
      },{
        label: "Female",
        fillColor: "rgba(0,0,0,0)",
        strokeColor: "#DD423E",
        data: [6000, 6100, 7000, 7000, 8000, 6000, 5300]
      }]
    }
  }),
  lineOptions: {
    responsive: true,
    scaleFontFamily: "'proxima-nova', 'Helvetica', 'Arial', sans-serif",
    scaleFontSize: 14,
    scaleFontColor: "#545759",
    tooltipFillColor: "rgba(0,0,0,0.8)",
    tooltipFontFamily: "'proxima-nova', 'Helvetica', 'Arial', sans-serif",
    tooltipFontSize: 16,
    tooltipCornerRadius: 2,

    scaleGridLineColor : "#f7f7f9",
    scaleShowHorizontalLines: false,
    bezierCurveTension : 0.25,
    datasetFill : true,
    datasetStrokeWidth : 3,
    pointDotStrokeWidth : 6
  }
})
