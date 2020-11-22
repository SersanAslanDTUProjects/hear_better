/// Example of a numeric combo chart with two series rendered as lines, and a
/// third rendered as points along the top line with a different color.
///
/// This example demonstrates a method for drawing points along a line using a
/// different color from the main series color. The line renderer supports
/// drawing points with the "includePoints" option, but those points will share
/// the same color as the line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';

class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericComboLinePointChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory NumericComboLinePointChart.withSampleData(Audiogram audiogram) {
    return new NumericComboLinePointChart(
      _createSampleData(audiogram),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          child: new charts.NumericComboChart(seriesList,
              animate: animate,
              behaviors: [
                charts.SlidingViewport(),
                charts.PanAndZoomBehavior()
              ],
              // Configure the default renderer as a line renderer. This will be used
              // for any series that does not define a rendererIdKey.
              defaultRenderer: new charts.LineRendererConfig(),
              defaultInteractions: false,
              domainAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                // Create the ticks to be used the domain axis.
                <charts.TickSpec<num>>[
                  new charts.TickSpec(250,
                      label: '250', style: charts.TextStyleSpec(fontSize: 12)),
                  //new charts.TickSpec(500, label: '500', style: charts.TextStyleSpec(fontSize: 14)),
                  new charts.TickSpec(1000,
                      label: '1000', style: charts.TextStyleSpec(fontSize: 12)),
                  new charts.TickSpec(2000,
                      label: '2000', style: charts.TextStyleSpec(fontSize: 12)),
                  new charts.TickSpec(4000,
                      label: '4000', style: charts.TextStyleSpec(fontSize: 12)),
                  new charts.TickSpec(6000,
                      label: '6000', style: charts.TextStyleSpec(fontSize: 12)),
                  new charts.TickSpec(8000,
                      label: '8000  Hz',
                      style: charts.TextStyleSpec(fontSize: 12)),
                ],
              )),
              primaryMeasureAxis: new charts.NumericAxisSpec(
                  renderSpec: charts.GridlineRendererSpec(
                      labelOffsetFromAxisPx: 10,
                      labelAnchor: charts.TickLabelAnchor.after,
                      lineStyle: charts.LineStyleSpec(
                        color: charts.MaterialPalette.transparent,
                        thickness: 0,
                      )),
                  tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                    // Create the ticks to be used the domain axis.
                    <charts.TickSpec<num>>[
                      new charts.TickSpec(10,
                          label: '10',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(20,
                          label: '20',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(30,
                          label: '30',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(40,
                          label: '40',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(50,
                          label: '50',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(60,
                          label: '60',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(70,
                          label: '70',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(80,
                          label: '80',
                          style: charts.TextStyleSpec(fontSize: 14)),
                      new charts.TickSpec(85,
                          label: 'dB',
                          style: charts.TextStyleSpec(fontSize: 14)),
                    ],
                  )),
              // Custom renderer configuration for the point series.
              customSeriesRenderers: [
                new charts.PointRendererConfig(
                    // ID used to link series to this renderer.
                    customRendererId: 'customPoint')
              ])),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<DataPoint, int>> _createSampleData(
      Audiogram audiogram) {
    List<DataPoint> leftEarData = audiogram.getLeftEarDataPoints();
    List<DataPoint> rightEarData = audiogram.getRightEarDataPoints();

    return [
      new charts.Series<DataPoint, int>(
        id: 'LeftEar',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataPoint dataPoint, _) => dataPoint.frequency,
        measureFn: (DataPoint dataPoint, _) => dataPoint.decibel,
        data: leftEarData,
      ),

      new charts.Series<DataPoint, int>(
        id: 'RightEar',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (DataPoint dataPoint, _) => dataPoint.frequency,
        measureFn: (DataPoint dataPoint, _) => dataPoint.decibel,
        data: rightEarData,
      ),

      new charts.Series<DataPoint, int>(
        id: 'IdealHearing',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (DataPoint dataPoint, _) => dataPoint.frequency,
        measureFn: (DataPoint dataPoint, _) => dataPoint.decibel,
        data: audiogram.idealHearing,
      ),

      // The Dots for the right ear chart
      new charts.Series<DataPoint, int>(
          id: 'RightEarDots',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (DataPoint dataPoints, _) => dataPoints.frequency,
          measureFn: (DataPoint dataPoints, _) => dataPoints.decibel,
          data: rightEarData)
        ..setAttribute(charts.rendererIdKey, 'customPoint'),

      // The Dots for the left ear chart
      new charts.Series<DataPoint, int>(
          id: 'LeftEarDots',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (DataPoint dataPoints, _) => dataPoints.frequency,
          measureFn: (DataPoint dataPoints, _) => dataPoints.decibel,
          data: leftEarData)
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}
