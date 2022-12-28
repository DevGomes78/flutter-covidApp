import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/flag_widget.dart';
import '../data/models/infections.dart';
import '../data/models/covid_models.dart';
import 'covid_page.dart';

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
              _infoDetails(),
              monthlyInfections(),
              graficStatus(constraints),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  _infoDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black87),
                height: 70,
                width: 120,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      StringConstants.mortes,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      data.deaths.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black87),
                height: 70,
                width: 120,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      StringConstants.casos,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 80),
                    Text(
                      data.cases.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  monthlyInfections() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Text(
        StringConstants.infeccoesMensais,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  graficStatus(constraints) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
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

  flagInfoDetails(String state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white12,
            ),
            height: 100,
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
                      fontSize: 20,
                    ),
                  ),
                ),
                  FlagWidget(state: state, height: 20),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CovidPage(),
                  ),
                );
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
