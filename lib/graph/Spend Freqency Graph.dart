import 'dart:convert';
import 'package:expense_app/functions/Function.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  // @override
  Widget build(BuildContext context) {
    final prov = Provider.of<function>(context);
    prov.operator8();
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        (const Text(
          'Spend Frequency',
          style: TextStyle(
              color: Color.fromRGBO(
                13,
                14,
                15,
                1,
              ),
              fontSize: 19,
              fontWeight: FontWeight.w600),
        )),
        AspectRatio(
          aspectRatio: 2.5,
          child: LineChart(
            LineChartData(
                maxX: 9,
                maxY: 5,
                minX: 0,
                minY: 0,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      spots: const [
                        FlSpot(0, 2),
                        FlSpot(2, 3),
                        FlSpot(4, 1.5),
                        FlSpot(6, 4),
                        FlSpot(7.5, 3),
                        FlSpot(9.5, 6.5),
                      ],
                      color: const Color.fromARGB(225, 127, 61, 255),
                      barWidth: 5,
                      dotData: const FlDotData(show: false),
                      isCurved: true,
                      curveSmoothness: 0.4,
                      belowBarData: BarAreaData(
                          show: true,
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(10, 127, 61, 255),
                                Color.fromARGB(155, 255, 255, 255)
                              ]))),
                ]),
          ),
        ),
        DefaultTabController(
          length: 4,
          child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.amber,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(248, 241, 237, 205)),
              tabs: const [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'week',
                ),
                Tab(
                  text: 'Month',
                ),
                Tab(
                  text: 'Year',
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transaction',
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 4.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 221, 234, 240),
                  ),
                  child: const Center(
                      child: Text(
                    'See All',
                    style: TextStyle(color: Color.fromARGB(225, 127, 61, 255)),
                  )),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          reverse: true,
          physics: const PageScrollPhysics(),
          shrinkWrap: true,
          itemCount: prov.transactions.length,
          itemBuilder: (context, index) {
            var transactionData = jsonDecode(prov.transactions[index]);

            return ListTile(
              leading: Image.asset('assets/${transactionData["category"]}.png'),
              title: Text(
                transactionData["category"],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(transactionData["subtitle"]),
              ),
              trailing: Column(
                children: [
                  transactionData["transactionType"] == "income"
                      ? Text(
                          '+\$${transactionData['amount']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.green),
                        )
                      : Text('-\$${transactionData['amount']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.red)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      transactionData["datetime"],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
