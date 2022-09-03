import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:flutter_covid_project/views/description_page.dart';
import 'package:provider/provider.dart';
import '../components/flag_widget.dart';
import '../constants/service_constants.dart';
import '../controlers/copvid_date_controller.dart';
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
  CovidDateController? controllerDate;

  @override
  void initState() {
    loadData();
    loadDate1();
    loadDate2();
    loadDate3();
    loadDate4();
    loadDate5();
    loadDate6();
    super.initState();
  }

  loadData() {
    controller = context.read<CovidController>();
    controller!.getData();
  }
  loadDate1() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate1();
  }
  loadDate2() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate2();
  }
  loadDate3() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate3();
  }
  loadDate4() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate4();
  }
  loadDate5() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate5();
  }
  loadDate6() {
    controllerDate = context.read<CovidDateController>();
    controllerDate!.getDate6();
  }


  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);
    CovidDateController providerDate1 = Provider.of<CovidDateController>(context);
    CovidDateController providerDate2 = Provider.of<CovidDateController>(context);
    CovidDateController providerDate3 = Provider.of<CovidDateController>(context);
    CovidDateController providerDate4 = Provider.of<CovidDateController>(context);
    CovidDateController providerDate5 = Provider.of<CovidDateController>(context);
    CovidDateController providerDate6 = Provider.of<CovidDateController>(context);
    return LayoutBuilder(
      builder: (context,constraints)=>
      Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              banner(BoxConstraints,constraints),
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
                            .format(DateTime.parse(DateTime.now().toString()))),
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: constraints.maxHeight /3.5,
                width: double.infinity,
                child: ListState(provider, constraints),
              ),
              const SizedBox(height: 10),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Text(
                  StringConstants.InfeccoesMensais,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ),
               ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: Container(
                  height: constraints.maxHeight / 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white12),
                  child: ListView.builder(
                    itemCount: providerDate1.listaMarco.length,
                    itemBuilder: (context,index)=>
                     SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                         title: ChartTitle(text: providerDate1.listaMarco[index].state.toString(),
                         textStyle: const TextStyle(color: Colors.yellow)
                         ),
                      // Enable legend
                  //   legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<Infections, String>>[
                        LineSeries<Infections, String>(
                            dataSource: <Infections>[
                              Infections('Marco',double.parse(
                                  providerDate1.listaMarco[index].deaths.toString())),
                              Infections('Abril',double.parse(
                                  providerDate2.listaAbril[index].deaths.toString())),
                              Infections('Maio',double.parse(
                                  providerDate3.listaMaio[index].deaths.toString())),
                              Infections('Junho', double.parse(
                                  providerDate4.listaJunho[index].deaths.toString())),
                              Infections('Julho', double.parse(
                                  providerDate5.listaJulho[index].deaths.toString())),
                              Infections('Agosto',double.parse(
                                  providerDate6.listaAgosto[index].deaths.toString())),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding banner(boxConstraints,constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Container(
        height: constraints.maxHeight /3.7,
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
                  fontSize: 25,
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
        style: TextStyle(fontSize: 25,color: Colors.white),
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

  ListView ListState(CovidController provider, BoxConstraints constraints) {
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
              width: constraints.maxWidth/2 - 10,
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
