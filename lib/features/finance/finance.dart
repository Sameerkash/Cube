import 'package:cube/common_utils/text_style.dart';
import 'package:cube/core/widgets/dark_bottom_sheet.dart';
import 'package:cube/features/finance/chart.dart';
import 'package:cube/features/finance/cubit/orders_cubit.dart';
import 'package:cube/features/finance/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({super.key});

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) buildOrdersBottomSheet(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances Page'),
      ),
      body: Column(
        children: [
          // Chart View
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
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
          // Container(
          //   height: 200,
          //   width: 200,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 3, // Replace with actual benefits/offers count
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Text('Loan Benefit ${index + 1}'),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  void buildOrdersBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return DarkBottomSheet(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My Orders',
                style: AppTextStyle.heading,
              ),
              Expanded(
                child: BlocProvider<OrdersCubit>(
                    create: (context) => OrdersCubit(), child: const OrdersList()),
              )
            ],
          ));
        });
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
