import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controlers/covid_controller.dart';

class CovidPageList extends StatefulWidget {
  const CovidPageList({Key? key}) : super(key: key);

  @override
  State<CovidPageList> createState() => _CovidPageListState();
}

class _CovidPageListState extends State<CovidPageList> {
  late final CovidController controller;

  @override
  void initState() {
    controller = context.read<CovidController>();
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              height: 200,
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
            Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 30),
                      Text(
                        'Atualização das trasnmissoes',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Ultima Atualização:',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  SizedBox(width: 90),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.refresh,
                        size: 35,
                      ))
                ],
              ),
            ),
            Container(
              height: 220,
              width: double.infinity,
              child: ListView.builder(
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
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(height: 10),
                          state == 'São Paulo'
                              ? Container(
                              height: 40,
                              child: Image.asset('images/saopaulo.png'))
                              : state == 'Minas Gerais'
                              ? Container(
                              height: 40,
                              child: Image.asset('images/mg.jpg'))
                              : state == 'Paraná'
                              ? Container(
                              height: 40,
                              child: Image.asset('images/pr.png'))
                              : state == 'Rio Grande do Sul'
                              ? Container(
                              height: 40,
                              child:
                              Image.asset('images/rgs.png'))
                              : state == 'Rio de Janeiro'
                              ? Container(
                              height: 40,
                              child: Image.asset(
                                  'images/rj.png'))
                              : state == 'Bahia'
                              ? Container(
                              height: 40,
                              child: Image.asset(
                                  'images/ba.png'))
                              : state == 'Santa Catarina'
                              ? Container(
                              height: 40,
                              child: Image.asset(
                                  'images/sc.png')) :
                          state == 'Goiás'
                              ? Container(
                              height: 40,
                              child: Image.asset(
                                  'images/sc.png'))
                              : state == 'Ceará'
                              ? Container(
                              height: 40,
                              child: Image.asset(
                                  'images/ce.png'))
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
                                  'images/df.png')) :
                          const SizedBox(height: 30),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mortes:  ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  lista.deaths.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
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
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20),
            Text('Ultimas notícias', style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold,),),
            SizedBox(height: 20),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white12
              ),
            )
          ],
        ),
      ),
    );
  }

}
