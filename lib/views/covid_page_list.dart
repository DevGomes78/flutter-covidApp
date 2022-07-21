import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controlers/covid_controller.dart';
import '../controlers/infections.dart';
import '../data/models/covid_models.dart';
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
            Container(
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
                      height: 290,
                      child: Image.asset(
                        'images/mask3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 180,
                    bottom: 120,
                    child: Text(
                      'Use sempre mascara! ',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 180,
                    bottom: 90,
                    child: Text(
                      'Utilize Alcool em gel',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 180,
                    bottom: 60,
                    child: Text(
                      'E Evite aglomeração',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  Text(
                    'Informaçoes por estado: ',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 100),
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
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Text(
                      'Ultima atualização: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 20),
                    Text(
                      (DateFormat(" dd/MM/yyyy")
                          .format(DateTime.parse(DateTime.now().toString()))),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 250,
              width: double.infinity,
              child: ListData(provider),
            ),
            SizedBox(height: 10),
            const Text(
              'Infecções mensais por Covid 19',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white12),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:  SfCartesianChart(
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
                          yValueMapper: (Infections victims, _) => victims.victims,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]))
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
        'App Covid 19',
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
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white30,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  lista.state.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                flagsState(state),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mortes:  ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        lista.deaths.toString(),
                        style: const TextStyle(
                            fontSize: 20,
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
                        'Casos:  ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        lista.cases.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suspeitos:  ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        (lista.suspects.toString()),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }


  Widget flagsState(String? state) {
    return state == 'São Paulo'
        ? Container(height: 40, child: Image.asset('images/saopaulo.png'))
        : state == 'Minas Gerais'
            ? Container(height: 40, child: Image.asset('images/mg.jpg'))
            : state == 'Paraná'
                ? Container(height: 40, child: Image.asset('images/pr.png'))
                : state == 'Rio Grande do Sul'
                    ? Container(
                        height: 40, child: Image.asset('images/rgs.png'))
                    : state == 'Rio de Janeiro'
                        ? Container(
                            height: 40, child: Image.asset('images/rj.png'))
                        : state == 'Bahia'
                            ? Container(
                                height: 40, child: Image.asset('images/ba.png'))
                            : state == 'Santa Catarina'
                                ? Container(
                                    height: 40,
                                    child: Image.asset('images/sc.png'))
                                : state == 'Goiás'
                                    ? Container(
                                        height: 40,
                                        child: Image.asset('images/sc.png'))
                                    : state == 'Ceará'
                                        ? Container(
                                            height: 40,
                                            child: Image.asset('images/ce.png'))
                                        : state == 'Espírito Santo'
                                            ? Container(
                                                height: 40,
                                                child: Image.asset(
                                                    'images/es.png'))
                                            : state == 'Pernambuco'
                                                ? Container(
                                                    height: 40,
                                                    child: Image.asset(
                                                        'images/pe.png'))
                                                : state == 'Distrito Federal'
                                                    ? Container(
                                                        height: 40,
                                                        child: Image.asset(
                                                            'images/df.png'))
                                                    : state == 'Pará'
                                                        ? Container(
                                                            height: 40,
                                                            child: Image.asset(
                                                                'images/para.png'))
                                                        : state == 'Mato Grosso'
                                                            ? Container(
                                                                height: 40,
                                                                child: Image.asset(
                                                                    'images/mt.png'))
                                                            : state == 'Paraíba'
                                                                ? Container(
                                                                    height: 40,
                                                                    child: Image
                                                                        .asset(
                                                                            'images/pb.png'))
                                                                : state ==
                                                                        'Amazonas'
                                                                    ? Container(
                                                                        height:
                                                                            40,
                                                                        child: Image.asset(
                                                                            'images/am.png'))
                                                                    : state ==
                                                                            'Mato Grosso do Sul'
                                                                        ? Container(
                                                                            height:
                                                                                40,
                                                                            child: Image.asset(
                                                                                'images/mts.png'))
                                                                        : state ==
                                                                                'Rio Grande do Norte'
                                                                            ? Container(
                                                                                height: 40,
                                                                                child: Image.asset('images/rgn.png'))
                                                                            : state == 'Maranhão'
                                                                                ? Container(height: 40, child: Image.asset('images/ma.png'))
                                                                                : state == 'Rondônia'
                                                                                    ? Container(height: 40, child: Image.asset('images/ro.png'))
                                                                                    : state == 'Piauí'
                                                                                        ? Container(height: 40, child: Image.asset('images/pi.png'))
                                                                                        : state == 'Sergipe'
                                                                                            ? Container(height: 40, child: Image.asset('images/se.png'))
                                                                                            : state == 'Tocantins'
                                                                                                ? Container(height: 40, child: Image.asset('images/to.png'))
                                                                                                : state == 'Alagoas'
                                                                                                    ? Container(height: 40, child: Image.asset('images/al.png'))
                                                                                                    : state == 'Amapá'
                                                                                                        ? Container(height: 40, child: Image.asset('images/amp.png'))
                                                                                                        : state == 'Roraima'
                                                                                                            ? Container(height: 40, child: Image.asset('images/rom.png'))
                                                                                                            : state == 'Acre'
                                                                                                                ? Container(height: 40, child: Image.asset('images/acr.png'))
                                                                                                                : const SizedBox(height: 30);
  }
}
