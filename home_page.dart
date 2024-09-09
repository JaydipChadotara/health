import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMART HEALTH"),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.sizeOf(context).height * 0.24,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 231, 227),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // First outer circle
                    AnimatedCircularChart(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NutrientLegendItem(
                          color: Colors.purple,
                          label: "Protein",
                          value: "324 of 640"),
                      SizedBox(height: 10),
                      NutrientLegendItem(
                          color: Colors.orange,
                          label: "Carbs",
                          value: "124 of 230"),
                      SizedBox(height: 10),
                      NutrientLegendItem(
                          color: Colors.teal, label: "Fat", value: "84 of 160"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),

        SizedBox(height: 24), // Space between sections
        // Bottom divided boxes
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4, // The number of columns
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              // Graph Section (4x2)

              // Training Section (2x1)
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1.5,
                child: _buildTile("Training", "90 minutes", Colors.black),
              ),
              // Steps Section (2x1)
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: _buildTile("Steps", "23456 steps", Colors.grey),
              ),
              // Cycling Section (2x1)
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: _buildTile("Cycling", "7 km", Colors.greenAccent),
              ),
              // Swimming Section (2x1)
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: _buildTile("Swimming", "160 minutes", Colors.lightBlue),
              ),
            ],
          ),
        ),
      ]),
    );

//   // Widget to build graph section
  }
}

// General reusable tile builder
Widget _buildTile(String title, String value, Color backgroundColor) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    ),
  );
}

class AnimatedCircularChart extends StatefulWidget {
  @override
  _AnimatedCircularChartState createState() => _AnimatedCircularChartState();
}

class _AnimatedCircularChartState extends State<AnimatedCircularChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Animation duration
    );

    _animation1 = Tween<double>(begin: 0, end: 75).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: 0, end: 65).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: 0, end: 80).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {});
      });

    // Start animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          foregroundPainter: CircularChartPainter(
              outerProgress: _animation1.value,
              middleProgress: _animation2.value,
              innerProgress: _animation3.value),
          child: Container(
            width: 180,
            height: 200,

            // child: Center(
            //   child: Text(
            //     "${_animation.value.toInt()}%",
            //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}

class CircularChartPainter extends CustomPainter {
  final double outerProgress;
  final double middleProgress;
  final double innerProgress;

  CircularChartPainter({
    required this.outerProgress,
    required this.middleProgress,
    required this.innerProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint the outer circle (background)
    Paint baseCircle = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, baseCircle);

    // Paint the outer progress arc
    Paint outerProgressArc = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double outerSweepAngle = 2 * pi * (outerProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      outerSweepAngle,
      false,
      outerProgressArc,
    );

    // Paint the middle circle (background)
    Paint middleBaseCircle = Paint()
      ..color = Colors.grey[200]!
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    double middleRadius = radius - 20; // Smaller radius for the middle circle
    canvas.drawCircle(center, middleRadius, middleBaseCircle);

    // Paint the middle progress arc
    Paint middleProgressArc = Paint()
      ..color = Colors.green
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double middleSweepAngle = 2 * pi * (middleProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: middleRadius),
      -pi / 2,
      middleSweepAngle,
      false,
      middleProgressArc,
    );

    // Paint the inner circle (background)
    Paint innerBaseCircle = Paint()
      ..color = Colors.grey[100]!
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    double innerRadius =
        middleRadius - 20; // Smaller radius for the inner circle
    canvas.drawCircle(center, innerRadius, innerBaseCircle);

    // Paint the inner progress arc
    Paint innerProgressArc = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double innerSweepAngle = 2 * pi * (innerProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      -pi / 2,
      innerSweepAngle,
      false,
      innerProgressArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class NutrientLegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const NutrientLegendItem({
    Key? key,
    required this.color,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "$label  $value",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
