import Ember from 'ember';

export default Ember.Component.extend({
  doughnutData: [{
    value: 300,
    color:"#005F9B",
    label: "Male"
  },{
    value: 350,
    color: "#DD423E",
    label: "Female"
  }],
  doughnutOptions: {
    responsive: true,
    scaleFontFamily: "'proxima-nova', 'Helvetica', 'Arial', sans-serif",
    scaleFontSize: 14,
    scaleFontColor: "#545759",
    tooltipFillColor: "rgba(0,0,0,0.8)",
    tooltipFontFamily: "'proxima-nova', 'Helvetica', 'Arial', sans-serif",
    tooltipFontSize: 16,
    tooltipCornerRadius: 2
    //
    // scaleGridLineColor : "#f7f7f9",
    // scaleShowHorizontalLines: false,
    // bezierCurveTension : 0.25,
    // datasetFill : true,
    // datasetStrokeWidth : 3,
    // pointDotStrokeWidth : 6
  }
})
