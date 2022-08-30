import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/service_constants.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/flag_widget.dart';
import '../controlers/covid_controller.dart';
import '../controlers/infections.dart';
import '../data/models/covid_models.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  Data data;

  Description({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);
    var state = data.state.toString();
    return LayoutBuilder(
      builder: (context,constraints)=>
       Scaffold(
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
                              horizontal: 100,
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
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
                                      DateTime.parse(data.datetime.toString()))),
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
                const SizedBox(height: 10),
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Charttitle
                      title: ChartTitle(
                          text: StringConstants.InfeccoesMensais,
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
                            yValueMapper: (Infections victims, _) =>
                                victims.victims,
                            // Enable data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                cardNoticiasCovid(BoxConstraints,constraints),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container cardNoticiasCovid(boxConstraints,constraints) {
    return Container(
      height: constraints.maxHeight /4,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              StringConstants.NoticiasSobreCovid,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  child: Image.asset(ServiceConstants.ImageAssetNoticias),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    StringConstants.NoticiasTexto,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
