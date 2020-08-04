/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutProgressBar extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutProgressBar(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        //
        // [ArcLabelDecorator] will automatically position the label inside the
        // arc if the label will fit. If the label will not fit, it will draw
        // outside of the arc with a leader line. Labels can always display
        // inside or outside using [LabelPosition].
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Todo, int>> createSampleData() {
    final data = [
      new Todo(0, "Walk dog", 10),
      new Todo(1, "Algebra", 100),
      new Todo(2, "Wash Dishes", 45),
      new Todo(3, "Fold Laundrey", 30),
    ];

    return [
      new charts.Series<Todo, int>(
        id: 'Tasks',
        domainFn: (Todo todo, _) => todo.id,
        measureFn: (Todo todo, _) => todo.minutes,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (Todo row, _) => '${row.name}: ${row.minutes} min.',
      )
    ];
  }
}

/// Sample linear data type.
class Todo {
  final String name;
  final int id;
  final int
      minutes; // when calling the constructor, all time set for this specific instance will be converted to minutes

  Todo(this.id, this.name, this.minutes);
}
