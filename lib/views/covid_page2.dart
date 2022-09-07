import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:flutter_covid_project/views/description_page.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/flag_widget.dart';
import '../constants/service_constants.dart';
import '../controlers/copvid_date_controller.dart';
import '../controlers/covid_controller.dart';

import 'package:intl/intl.dart';

import '../controlers/infections.dart';

class CovidPage2 extends StatefulWidget {
  const CovidPage2({Key? key}) : super(key: key);

  @override
  State<CovidPage2> createState() => _CovidPage2State();
}

class _CovidPage2State extends State<CovidPage2> {
  CovidController? controller;
  CovidDateController? controllerDate;

  @override
  void initState() {
    loadData();
    loadDate();

    super.initState();
  }

  loadData() {
    controller = context.read<CovidController>();
    controller!.getData();
  }

  loadDate() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate1();
    controllerDate!.getDate2();
    controllerDate!.getDate3();
    controllerDate!.getDate4();
    controllerDate!.getDate5();
    controllerDate!.getDate6();
  }



  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);

    return LayoutBuilder(
      builder: (context, constraints) =>
          Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  banner(BoxConstraints, constraints),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Text(
                          StringConstants.InformacoesPorEstado,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 80),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                .format(DateTime.parse(
                                DateTime.now().toString()))),
                            style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: constraints.maxHeight / 4,
                    width: double.infinity,
                    child: listState(provider, constraints),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Text(StringConstants.InfeccoesMensais,
                      style: TextStyle(fontSize: 20,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 10),
                    child: Container(
                      height: constraints.maxHeight / 2.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white12),
                      child: ListView.builder(
                        itemCount: controllerDate!.listaMarco.length,
                        itemBuilder: (context, index) =>
                            SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              // Chart title
                              title: ChartTitle(text: controllerDate!
                                  .listaMarco[index].state.toString(),
                                  textStyle: const TextStyle(
                                      color: Colors.yellow)
                              ),
                              // Enable legend
                              //   legend: Legend(isVisible: true),
                              // Enable tooltip
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries<Infections, String>>[
                                LineSeries<Infections, String>(
                                    dataSource: <Infections>[
                                      Infections('Marco', double.parse(
                                          controllerDate!.listaMarco[index]
                                              .deaths.toString())),
                                      Infections('Abril', double.parse(
                                          controllerDate!.listaAbril[index]
                                              .deaths.toString())),
                                      Infections('Maio', double.parse(
                                          controllerDate!.listaMaio[index]
                                              .deaths.toString())),
                                      Infections('Junho', double.parse(
                                          controllerDate!.listaJunho[index]
                                              .deaths.toString())),
                                      Infections('Julho', double.parse(
                                          controllerDate!.listaJulho[index]
                                              .deaths.toString())),
                                      Infections('Agosto', double.parse(
                                          controllerDate!.listaAgosto[index]
                                              .deaths.toString())),
                                    ],
                                    xValueMapper: (Infections victims,
                                        _) => victims.year,
                                    yValueMapper: (Infections victims, _) =>
                                    victims.victims,
                                    // Enable data label
                                    dataLabelSettings:
                                    const DataLabelSettings(isVisible: true))
                              ],
                            ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
    );
  }

  Padding banner(boxConstraints, constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Container(
        height: constraints.maxHeight / 4,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        child: Stack(
          children: [
            Positioned(
              left: -50,
              bottom: -80,
              child: SizedBox(
                height: 280,
                child: Image.asset(
                  ServiceConstants.ImageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              left: 150,
              bottom: 120,
              child: Text(
                StringConstants.UseSempreMascara,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            const Positioned(
              left: 170,
              bottom: 90,
              child: Text(
                StringConstants.UtilizeAlcoolGel,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Positioned(
              left: 170,
              bottom: 60,
              child: Text(
                StringConstants.EviteAglomeracao,
                style: TextStyle(
                  fontSize: 20,
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
      title: const Text(
        StringConstants.AppCovid19,
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }

  ListView listState(CovidController provider, BoxConstraints constraints) {
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
              width: constraints.maxWidth / 2 - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white12,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    lista.state.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  FlagWidget(state: state, height: 40),
                  const SizedBox(height: 10),
                  Divider(),
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
                              color: Colors.white,
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
                        const Text(
                          StringConstants.Casos,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          lista.cases.toString(),
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
