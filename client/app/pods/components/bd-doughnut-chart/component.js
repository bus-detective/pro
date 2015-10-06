import Ember from 'ember';
let { computed } = Ember;

export default Ember.Component.extend({  
  doughnutOptions: {
    responsive: true,
    scaleFontFamily: "'proxima-nova', 'Helvetica', 'Arial', sans-serif",
    scaleFontSize: 15,
    scaleFontColor: "#545759",
    tooltipFillColor: "rgba(0,0,0,0.8)",
    tooltipFontFamily: "'proxima-nova', 'Helvetica', 'Arial', sans-serif",
    tooltipFontSize: 18,
    tooltipCornerRadius: 2,
    legendTemplate : "<ul class=\"list-unstyled col-md-4 <%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"

    //
    // scaleGridLineColor : "#f7f7f9",
    // scaleShowHorizontalLines: false,
    // bezierCurveTension : 0.25,
    // datasetFill : true,
    // datasetStrokeWidth : 3,
    // pointDotStrokeWidth : 6
  }
});
