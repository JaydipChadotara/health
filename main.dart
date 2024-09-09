// // import 'package:flutter/material.dart';
// // import 'package:smart_healths/splash.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       home: MySplashScreen(),
// //     );
// //   }
// // }
// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text("Smart Life Health Care"),
// // //           backgroundColor: Colors.orange,
// // //         ),
// // //         body: HealthDashboard(),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class HealthDashboard extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         gradient: LinearGradient(
// // //           colors: [Colors.orangeAccent, Colors.white],
// // //           begin: Alignment.topCenter,
// // //           end: Alignment.bottomCenter,
// // //         ),
// // //       ),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           children: [
// // //             // Steps, Km, Kcal Row
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 healthInfoCard("Steps", "7456", Icons.directions_walk),
// // //                 healthInfoCard("Km", "7.1", Icons.directions_run),
// // //                 healthInfoCard("Kcal", "682", Icons.local_fire_department),
// // //               ],
// // //             ),
// // //             SizedBox(height: 20),
// // //             // Running Section
// // //             runningInfoCard("Running", "4.35 Km", "36:05"),
// // //             SizedBox(height: 20),
// // //             // Sleep and Heart Rate
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 healthInfoCard("Sleep", "8h 36m", Icons.bed),
// // //                 healthInfoCard("Heart Rate", "106 BPM", Icons.favorite),
// // //               ],
// // //             ),
// // //             SizedBox(height: 20),
// // //             // Stress Monitor and Weight
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 healthInfoCard("Stress Monitor", "45", Icons.stacked_bar_chart),
// // //                 healthInfoCard("Weight", "66.6 Kg", Icons.monitor_weight),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget healthInfoCard(String title, String value, IconData icon) {
// // //     return Expanded(
// // //       child: Card(
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.all(8.0),
// // //               child: Icon(icon, size: 40, color: Colors.orange),
// // //             ),
// // //             Text(value,
// // //                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // //             Text(title, style: TextStyle(fontSize: 16)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget runningInfoCard(String title, String distance, String time) {
// // //     return Card(
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Row(
// // //           children: [
// // //             Icon(Icons.directions_run, size: 40, color: Colors.orange),
// // //             SizedBox(width: 20),
// // //             Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(title, style: TextStyle(fontSize: 16)),
// // //                 Text(distance,
// // //                     style:
// // //                         TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // //                 Text(time, style: TextStyle(fontSize: 16)),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // // }

// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class InsightsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Insights"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: StaggeredGrid.count(
//           crossAxisCount: 4, // The number of columns
//           mainAxisSpacing: 12,
//           crossAxisSpacing: 12,
//           children: [
//             // Graph Section (4x2)
//             StaggeredGridTile.count(
//               crossAxisCellCount: 4,
//               mainAxisCellCount: 2,
//               child: _buildGraphTile(),
//             ),
//             // Training Section (2x1)
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1.5,
//               child: _buildTile("Training", "90 minutes", Colors.black),
//             ),
//             // Steps Section (2x1)
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildTile("Steps", "23456 steps", Colors.grey),
//             ),
//             // Cycling Section (2x1)
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildTile("Cycling", "7 km", Colors.greenAccent),
//             ),
//             // Swimming Section (2x1)
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildTile("Swimming", "160 minutes", Colors.lightBlue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget to build graph section
//   Widget _buildGraphTile() {
//     return Container(
//       margin: EdgeInsets.all(20),
//       height: 90,
//       w,
//       decoration: BoxDecoration(
//           color: Color.fromARGB(255, 231, 231, 227),
//           borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 // First outer circle
//                 CircularPercentIndicator(
//                   radius: 90.0,
//                   lineWidth: 15.0,
//                   percent: 0.8, // 80% progress for outer circle
//                   circularStrokeCap: CircularStrokeCap.round,
//                   backgroundColor: Colors.grey[300]!,
//                   progressColor: Colors.redAccent[100],
//                   reverse: false,
//                 ),
//                 // Second middle circle
//                 CircularPercentIndicator(
//                   radius: 60.0,
//                   lineWidth: 15.0,
//                   percent: 0.6, // 60% progress for middle circle
//                   circularStrokeCap: CircularStrokeCap.round,
//                   backgroundColor: Colors.grey[200]!,
//                   progressColor: Colors.redAccent[400],
//                   reverse: false,
//                 ),
//                 // Third inner circle
//                 CircularPercentIndicator(
//                   radius: 40.0,
//                   lineWidth: 15.0,
//                   percent: 0.4, // 40% progress for inner circle
//                   circularStrokeCap: CircularStrokeCap.round,
//                   backgroundColor: Colors.grey[100]!,
//                   progressColor: Colors.redAccent[700],
//                   reverse: false,
//                   // center: Column(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     Text(
//                   //       "Today",
//                   //       style: TextStyle(
//                   //         fontSize: 13.0,
//                   //         fontWeight: FontWeight.bold,
//                   //       ),
//                   //     ),
//                   //     Text(
//                   //       "2000",
//                   //       style: TextStyle(
//                   //         fontSize: 13.0,
//                   //         fontWeight: FontWeight.bold,
//                   //       ),
//                   //     ),
//                   //     Text(
//                   //       "Kcal",
//                   //       style: TextStyle(
//                   //         fontSize: 13.0,
//                   //         color: Colors.grey,
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 width: 80,
//                 height: 80,
//                 child: Center(child: Text("data")),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 width: 80,
//                 height: 80,
//                 child: Center(child: Text("data")),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 width: 80,
//                 height: 180,
//                 child: Center(child: Text("data")),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   // General reusable tile builder
//   Widget _buildTile(String title, String value, Color backgroundColor) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//           SizedBox(height: 4),
//           Text(
//             value,
//             style: TextStyle(
//                 fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smart_healths/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
    );
  }
}
