import 'package:flutter/material.dart';

class ChartList extends StatefulWidget {
  const ChartList({super.key});

  @override
  State<ChartList> createState() => _ChartListState();
}

class _ChartListState extends State<ChartList> {
  List<bool> _expandedStateList = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    // List listofvalue = ['blood', 'step', 'oxygen', 'Cycle Tracking'];

    return Scaffold(
      body: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            _expandedStateList.insert(
                newIndex, _expandedStateList.removeAt(oldIndex));
          },
          itemCount: _expandedStateList.length,
          itemBuilder: (context, index) {
            return Padding(
                key: Key(index.toString()),
                padding: const EdgeInsets.all(1.0),
                child: Card(
                    color: Color.fromARGB(255, 233, 237, 240),
                    child: Column(
                      children: [
                        // Main List Item (acts as the title)
                        ListTile(
                          title: Text('Item ${index + 1}'),
                          trailing: IconButton(
                            icon: Icon(
                              _expandedStateList[index]
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                            ),
                            onPressed: () {
                              setState(() {
                                _expandedStateList[index] =
                                    !_expandedStateList[index];
                              });
                            },
                          ),
                        ),
                        // Expanded content, visibility controlled by state
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: _expandedStateList[index] ? 100 : 0,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: _expandedStateList[index]
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'This is extra content for Item ${index + 1}.',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Additional details can go here.',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              : Container(),
                        ),
                      ],
                    )));
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
