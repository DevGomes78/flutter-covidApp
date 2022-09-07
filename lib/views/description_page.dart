import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/flag_widget.dart';
import '../controlers/infections.dart';
import '../data/models/covid_models.dart';

class Description extends StatelessWidget {
  Data data;

  Description({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = data.state.toString();
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white12,
                      ),
                      height: 350,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: Text(
                              data.state.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FlagWidget(state: state, height: 100),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  StringConstants.Mortes,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 70),
                                Text(
                                  data.deaths.toString(),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  StringConstants.Casos,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 80),
                                Text(
                                  data.cases.toString(),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  StringConstants.Suspeitos,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 45),
                                Text(
                                  data.suspects.toString(),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  StringConstants.Data,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 90),
                                Text(
                                  (DateFormat(" dd/MM/yyyy").format(
                                      DateTime.parse(
                                          data.datetime.toString()))),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Text(StringConstants.InfeccoesMensais,
                      style: TextStyle(fontSize: 20)),
                ),
                Container(
                  height: constraints.maxHeight / 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<Infections, String>>[
                      LineSeries<Infections, String>(
                          dataSource: <Infections>[
                            Infections('Jan', 14000),
                            Infections('Feb', 11000),
                            Infections('Mar', 15000),
                            Infections('Apr', 13000),
                            Infections('May', 16000),
                            Infections('Jun', 12000)
                          ],
                          xValueMapper: (Infections victims, _) =>
                              victims.year,
                          yValueMapper: (Infections victims, _) =>
                              victims.victims,
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
