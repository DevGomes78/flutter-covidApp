import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:flutter_covid_project/views/description_page.dart';
import 'package:provider/provider.dart';
import '../components/flag_widget.dart';
import '../constants/service_constants.dart';
import '../controlers/covid_controller.dart';
import '../controlers/infections.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CovidPageList extends StatefulWidget {
  const CovidPageList({Key? key}) : super(key: key);

  @override
  State<CovidPageList> createState() => _CovidPageListState();
}

class _CovidPageListState extends State<CovidPageList> {
  CovidController? controller;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    controller = context.read<CovidController>();
    controller!.getData();
  }

  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            banner(),
            const SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  const Text(
                    StringConstants.InformacoesPorEstado,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 50),
                  IconButton(
                    onPressed: loadData,
                    icon: const Icon(
                      Icons.refresh,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    const Text(
                      StringConstants.UltimaAtualizacap,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      (DateFormat(" dd/MM/yyyy")
                          .format(DateTime.parse(DateTime.now().toString()))),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 230,
              width: double.infinity,
              child: ListData(provider),
            ),
            const SizedBox(height: 10),
            const Text(
              StringConstants.InfeccoesMensais,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 145,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white12),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  //   title: ChartTitle(text: 'Monthly Covid-19 Infections'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<Infections, String>>[
                    LineSeries<Infections, String>(
                        dataSource: <Infections>[
                          Infections('Jan', 35000),
                          Infections('Feb', 20000),
                          Infections('Mar', 34000),
                          Infections('Apr', 32000),
                          Infections('May', 40000),
                          Infections('Jun', 60000)
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
          ],
        ),
      ),
    );
  }

  Padding banner() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Container(
        height: 190,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
        ),
        child: Stack(
          children: [
            Positioned(
              left: -45,
              bottom: -80,
              child: Container(
                height: 250,
                child: Image.asset(
                  ServiceConstants.ImageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              left: 140,
              bottom: 120,
              child: Text(
                StringConstants.UseSempreMascara,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Positioned(
              left: 140,
              bottom: 90,
              child: Text(
                StringConstants.UtilizeAlcoolGel,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Positioned(
              left: 140,
              bottom: 60,
              child: Text(
                StringConstants.EviteAglomeracao,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
       StringConstants.AppCovid19,
        style: TextStyle(fontSize: 25),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
        ),
      ),
    );
  }

  ListView ListData(CovidController provider) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.lista.length,
        itemBuilder: (context, index) {
          var lista = provider.lista[index];
          var state = provider.lista[index].state;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Description(data: lista)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white30,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    lista.state.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  FlagWidget(state: state, height: 40),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          StringConstants.Mortes,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          lista.deaths.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.Casos,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          lista.cases.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.Suspeitos,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          (lista.suspects.toString()),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
