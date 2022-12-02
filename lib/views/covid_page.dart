import 'package:flutter/material.dart';
import 'package:flutter_covid_project/components/list_state.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:provider/provider.dart';
import '../components/botton_card.dart';
import '../components/top_card.dart';
import 'package:intl/intl.dart';

import '../service/covid_controller.dart';
import '../service/search_controller.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  CovidController controller = CovidController();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    controller = context.read<CovidController>();
    controller.getData(query: '');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          children: [
            const SizedBox(height: 10),
            const TopCard(),
            _infoState(),
            _lastUpdate(),
            const SizedBox(height: 8),
            const ListSate(),
            textNoticiasSobreaCovid(),
            const BottonCard(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _infoState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Text(
            StringConstants.informacoesPorEstado,
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
    );
  }

  _lastUpdate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          const Text(
            StringConstants.ultimaAtualizacap,
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
    );
  }

  Padding textNoticiasSobreaCovid() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        StringConstants.noticiasSobreCovid,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        StringConstants.appCovid19,
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
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchState(),
            );
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }
}
