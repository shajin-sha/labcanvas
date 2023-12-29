import 'package:flutter/material.dart';
import 'package:graphical_abstract/theme/color.dart';
import 'package:graphical_abstract/viewmodel/graphical_abstract_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class OverallScore extends StatelessWidget {
  const OverallScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text("Overall Score", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
        Text("Your overall score is ${context.watch<GraphicalAbstractViewModel>().overallScore}/5", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
        const SizedBox(height: 20),
        SizedBox(
          width: 700,
          child: SfLinearGauge(
            useRangeColorForAxis: true,
            showLabels: true,
            animateAxis: true,
            // remove number
            showTicks: false,
            showAxisTrack: false,
            interval: 0,
            maximum: 6,
            markerPointers: <LinearMarkerPointer>[
              LinearShapePointer(animationType: LinearAnimationType.ease, value: context.watch<GraphicalAbstractViewModel>().overallScore.toDouble() - 0.6, width: 20, height: 20, color: Colors.black, shapeType: LinearShapePointerType.triangle, position: LinearElementPosition.cross, markerAlignment: LinearMarkerAlignment.start),
            ],

            ranges: <LinearGaugeRange>[
              // Very poor, poor, fair, good, excellent
              // f58a86, fcf181,98cd7d,5fbe76
              LinearGaugeRange(
                startValue: 0,
                endValue: 1,
                color: UiColors.hexToColor("#f7b0b2"),
                startWidth: 50,
                endWidth: 50,
                rangeShapeType: LinearRangeShapeType.curve,
                edgeStyle: LinearEdgeStyle.startCurve,
                child: labelBuilder(context, 'Very Poor'),
              ),
              LinearGaugeRange(
                startValue: 1,
                endValue: 2,
                color: UiColors.hexToColor("#ffd79e"),
                startWidth: 50,
                endWidth: 50,
                rangeShapeType: LinearRangeShapeType.curve,
                child: labelBuilder(context, 'Poor'),
              ),
              LinearGaugeRange(
                startValue: 2,
                endValue: 3,
                color: UiColors.hexToColor("#fff4a7"),
                startWidth: 50,
                endWidth: 50,
                rangeShapeType: LinearRangeShapeType.curve,
                child: labelBuilder(context, 'Fair'),
              ),
              LinearGaugeRange(
                startValue: 3,
                endValue: 4,
                color: UiColors.hexToColor("#d0e4a9"),
                startWidth: 50,
                endWidth: 50,
                rangeShapeType: LinearRangeShapeType.curve,
                child: labelBuilder(context, 'Good'),
              ),
              LinearGaugeRange(
                startValue: 4,
                endValue: 5,
                color: UiColors.hexToColor("#9acc9a"),
                startWidth: 50,
                endWidth: 50,
                rangeShapeType: LinearRangeShapeType.curve,
                edgeStyle: LinearEdgeStyle.endCurve,
                child: labelBuilder(context, 'Excellent'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Center(child: Text('Excellent', style: TextStyle(color: Colors.black))),

// Label builder
Widget labelBuilder(BuildContext context, String text) {
  return Center(
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
  );
}
