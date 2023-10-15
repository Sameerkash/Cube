import 'package:cube/features/finance/chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chart View
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: LineChartSample2(),
        ),

        // ListView for latest sales
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Replace with actual sales data count
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Customer Name $index'),
                subtitle: Text(
                    'Date: 2023-10-10, Order Number: $index, Total Price: \$100'),
              );
            },
          ),
        ),

        // Horizontal list of cards for loan benefits and offers
        Container(
          height: 200,
          width: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Replace with actual benefits/offers count
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Loan Benefit ${index + 1}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LineChartSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: const FlTitlesData(
          show: false,
          topTitles: AxisTitles(axisNameWidget: Text('Revenue')),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 2),
              FlSpot(4, 5),
              FlSpot(5, 1),
              FlSpot(6, 4),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
