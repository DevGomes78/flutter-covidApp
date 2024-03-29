import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/string_constants.dart';
import '../service/covid_service.dart';
import '../views/description_page.dart';
import 'flag_widget.dart';

class ListSate extends StatefulWidget {
  const ListSate({Key? key}) : super(key: key);

  @override
  State<ListSate> createState() => _ListSateState();
}

class _ListSateState extends State<ListSate> {
  CovidService controller = CovidService();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    controller = context.read<CovidService>();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    CovidService provider = Provider.of<CovidService>(context);
    return _listState(context, provider);
  }

  _listState(BuildContext context, CovidService provider) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      width: double.infinity,
      child: ListView.builder(
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
                width: MediaQuery.of(context).size.width / 2 - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      lista.state.toString(),
                      style: const TextStyle(fontSize: 16,color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: FlagWidget(state: state, height: 50)),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.white70),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            StringConstants.mortes,
                            style: TextStyle(fontSize: 14,color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            lista.deaths.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            StringConstants.casos,
                            style: TextStyle(fontSize: 14,color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            lista.cases.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
