import 'package:flutter/material.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  @override
  Widget build(BuildContext context) {
    List listofvalue = ['jaydip', 'chadotara', 'het'];
    bool isOnTap = true;

    return Scaffold(
      body: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            listofvalue.insert(newIndex, listofvalue.removeAt(oldIndex));
          },
          itemCount: listofvalue.length,
          itemBuilder: (context, index) {
            return Padding(
                key: Key(index.toString()),
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  color: Color.fromARGB(255, 233, 237, 240),
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    minLeadingWidth: 20,
                    titleAlignment: ListTileTitleAlignment.center,
                    // leading: CircleAvatar(
                    //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    //   radius: MediaQuery.of(context).size.width * 0.05,
                    //   child: Text(
                    //     '\₹${listofvalue[index].price.toString()}',
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: MediaQuery.of(context).size.width * 0.04),
                    //   ),
                    // ),
                    title: Text('${listofvalue[index]}',
                        style: TextStyle(
                            fontFamily: 'NotoSerifGujarati',
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                      icon: Icon(Icons.expand_less),
                      onPressed: () {
                        setState(() {
                          isOnTap = !isOnTap;
                        });
                        isOnTap
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'Additional details for Item ${index + 1}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : Container();
                      },
                    ),
                  ),
                ));
          }),
    );
  }
}
    // return LineChart(
    //   LineChartData(
    //     gridData: FlGridData(show: false),
    //     titlesData: FlTitlesData(
    //       bottomTitles: AxisTitles(
    //         sideTitles: SideTitles(
    //           showTitles: false,
    //         ),
    //       ),
    //       leftTitles: AxisTitles(
    //         sideTitles: SideTitles(
    //           showTitles: false,
    //         ),
    //       ),
    //       rightTitles: AxisTitles(
    //         sideTitles: SideTitles(
    //           showTitles: false,
    //         ),
    //       ),
    //       topTitles: AxisTitles(
    //         sideTitles: SideTitles(
    //           showTitles: false,
    //         ),
    //       ),
    //     ),
    //     borderData: FlBorderData(show: false),
    //     minX: 0,
    //     maxX: 12,
    //     maxY: 4,
    //     minY: 0,
    //     lineBarsData: [
    //       LineChartBarData(
    //         spots: [
    //           const FlSpot(0, 3),
    //           const FlSpot(1.5, 3.3),
    //           const FlSpot(3, 4),
    //           const FlSpot(5, 3),
    //           const FlSpot(7, 4),
    //           const FlSpot(9, 3),
    //           const FlSpot(11, 4),
    //           const FlSpot(12, 3),
    //         ],
    //         isCurved: true,
    //         // color: Colors.pink.withOpacity(0.5),
    //         barWidth: 3,
    //         dotData: FlDotData(
    //           show: false,
    //         ),
    //         belowBarData: BarAreaData(
    //           show: true,
    //           // color: Colors.pink.withOpacity(0.1),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
