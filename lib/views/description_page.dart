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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              flagInfoDetails(state, context),
              const SizedBox(height: 10),
              graficStatus(constraints),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Padding graficStatus(constraints) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Charttitle
            title: ChartTitle(
                text: StringConstants.InfeccoesMensais,
                textStyle: const TextStyle(
                  fontSize: 15,
                )),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
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
                  xValueMapper: (Infections victims, _) => victims.year,
                  yValueMapper: (Infections victims, _) => victims.victims,
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ],
          ),
        ),
      ),
    );
  }

  Padding flagInfoDetails(String state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
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
                    horizontal: 100,
                    vertical: 20,
                  ),
                  child: Text(
                    data.state.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                FlagWidget(state: state, height: 100),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
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
                          fontSize: 20,
                        ),
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
                        ),
                      ),
                      const SizedBox(width: 80),
                      Text(
                        data.cases.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
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
                        ),
                      ),
                      const SizedBox(width: 45),
                      Text(
                        data.suspects.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
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
                        ),
                      ),
                      const SizedBox(width: 90),
                      Text(
                        (DateFormat(" dd/MM/yyyy")
                            .format(DateTime.parse(data.datetime.toString()))),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
