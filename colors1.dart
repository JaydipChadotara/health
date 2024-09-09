import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Activity'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Today'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBody(),
            Center(child: Text('Weekly View')),
            Center(child: Text('Monthly View')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ''),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCalorieCard('Eaten', '734', Icons.local_dining, Colors.green),
                _buildCalorieCard('Burned', '363', Icons.local_fire_department, Colors.red),
              ],
            ),
            SizedBox(height: 20),
            _buildBarChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 40),
            SizedBox(height: 10),
            Text(
              '$value Kcal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overall Progress',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 1.5,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: 10,
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                      return Text(days[value.toInt()]);
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              barGroups: _buildBarGroups(),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      _makeGroupData(0, 5, 7),
      _makeGroupData(1, 6, 5),
      _makeGroupData(2, 8, 6),
      _makeGroupData(3, 7, 4),
      _makeGroupData(4, 6, 5),
      _makeGroupData(5, 9, 8),
      _makeGroupData(6, 5, 7),
    ];
  }

  BarChartGroupData _makeGroupData(int x, double goal, double current) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: goal,
          color: Colors.orange,
          width: 15,
        ),
        BarChartRodData(
          toY: current,
          color: Colors.purple,
          width: 15,
        ),
      ],
    );
  }
}
