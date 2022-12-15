import 'package:flutter/material.dart';
import 'package:flutter_covid_project/components/list_state.dart';
import 'package:flutter_covid_project/constants/error_constants.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:provider/provider.dart';
import '../components/botton_card.dart';
import '../components/top_card.dart';
import 'package:intl/intl.dart';
import '../service/covid_service.dart';
import '../components/search_state.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  CovidService controller = CovidService();
  CovidService dateController = CovidService();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    dateController = context.read<CovidService>();
    dateController.getupdate();
    controller = context.read<CovidService>();
    controller.getData();
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 130),
          IconButton(
            onPressed: loadData,
            icon: const Icon(
              Icons.refresh,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  _lastUpdate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20, vertical: 5),
      child: Row(
        children: [
          const Text(
            StringConstants.ultimaAtualizacap,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 20),
          FutureBuilder<Map<String, dynamic>>(
              future: dateController.getupdate(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(ErrorConstants.errorPage),
                        ),
                      );
                    } else {
                      return Text(
                        (DateFormat(" dd/MM/yyyy").format(DateTime.parse(
                            dateController.decodejson['data'][0]['datetime']
                                .toString()))),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      );
                    }
                }
              }),
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
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
        ),
      ),
      title: const Text(StringConstants.appCovid19),
      backgroundColor: Colors.black12,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchState(),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
