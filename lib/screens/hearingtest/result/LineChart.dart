/// Example of a numeric combo chart with two series rendered as lines, and a
/// third rendered as points along the top line with a different color.
///
/// This example demonstrates a method for drawing points along a line using a
/// different color from the main series color. The line renderer supports
/// drawing points with the "includePoints" option, but those points will share
/// the same color as the line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericComboLinePointChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory NumericComboLinePointChart.withSampleData() {
    return new NumericComboLinePointChart(
      _createSampleData(),
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
                // Configure the default renderer as a line renderer. This will be used
                // for any series that does not define a rendererIdKey.
                defaultRenderer: new charts.LineRendererConfig(),
                defaultInteractions: false,
                domainAxis: new charts.NumericAxisSpec(
                    tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                      // Create the ticks to be used the domain axis.
                      <charts.TickSpec<num>>[
                        new charts.TickSpec(250, label: '250', style: charts.TextStyleSpec(fontSize: 14)),
                        //new charts.TickSpec(500, label: '500', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(1000, label: '1000', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(2000, label: '2000', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(4000, label: '4000', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(6000, label: '6000', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(8000, label: '8000', style: charts.TextStyleSpec(fontSize: 14)),
                      ],
                    )),
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: charts.GridlineRendererSpec(
                        labelOffsetFromAxisPx: 10,
                        labelAnchor: charts.TickLabelAnchor.after,
                        lineStyle: charts.LineStyleSpec(
                          color: charts.MaterialPalette.transparent,
                          thickness: 0,
                        )
                  ),
                    tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                      // Create the ticks to be used the domain axis.
                      <charts.TickSpec<num>>[
                        new charts.TickSpec(10, label: '10', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(20, label: '20', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(30, label: '30', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(40, label: '40', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(50, label: '50', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(60, label: '60', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(70, label: '70', style: charts.TextStyleSpec(fontSize: 14)),
                        new charts.TickSpec(80, label: '80', style: charts.TextStyleSpec(fontSize: 14)),
                      ],
                    )
                ),
                // Custom renderer configuration for the point series.
                customSeriesRenderers: [
                  new charts.PointRendererConfig(
                    // ID used to link series to this renderer.
                      customRendererId: 'customPoint')
                ])
        ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final desktopSalesData = [
      new LinearSales(250, 10),
      new LinearSales(500, 7),
      new LinearSales(1000, 10),
      new LinearSales(2000, 35),
      new LinearSales(4000, 70),
      new LinearSales(8000, 75)
    ];

    final tableSalesData = [
      new LinearSales(250, 8),
      new LinearSales(500, 10),
      new LinearSales(1000, 10),
      new LinearSales(2000, 40),
      new LinearSales(4000, 78),
      new LinearSales(8000, 70)
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,

        data: tableSalesData,
      ),
      new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          displayName: 'tdawdwadas',

          data: tableSalesData)
      // Configure our custom point renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
      new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: desktopSalesData)
      // Configure our custom point renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class TestAudiogram {
  int decibel;
  int frequency;

  TestAudiogram(this.decibel, this.frequency);
}