import Ember from 'ember';
let { computed } = Ember;

export default Ember.Component.extend({
  dataDecorated: computed.map('data', function(data) {
    data.color = "#F7464A";
    return data;
  }),

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
});
