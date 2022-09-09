import 'package:flutter/material.dart';
import 'package:flutter_covid_project/constants/string_constants.dart';
import 'package:flutter_covid_project/views/description_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/flag_widget.dart';
import '../constants/error_constants.dart';
import '../constants/image_constants.dart';
import '../constants/service_constants.dart';
import '../controlers/covid_controller.dart';
import 'package:intl/intl.dart';
import '../controlers/search_controller.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  CovidController? controller;

  @override
  void initState() {
    loadData();

    super.initState();
  }

  loadData() {
    controller = context.read<CovidController>();
    controller!.getData(query: '');
  }

  @override
  Widget build(BuildContext context) {
    CovidController provider = Provider.of<CovidController>(context);

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              cardUseMascara(BoxConstraints, constraints),
              textIfonState(),
              textInfostatusUpdate(),
              const SizedBox(height: 8),
              SizedBox(
                height: constraints.maxHeight / 4,
                width: double.infinity,
                child: listState(provider, constraints),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  StringConstants.NoticiasSobreCovid,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              cardNoticiaCovid(constraints),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Stack cardNoticiaCovid(BoxConstraints constraints) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: constraints.maxHeight / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(ImageConstants.ImageAssetNoticias),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              height: constraints.maxHeight / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      StringConstants.NoticiasTexto,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding textInfostatusUpdate() {
    return Padding(
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
    );
  }

  Padding textIfonState() {
    return Padding(
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
    );
  }

  Padding cardUseMascara(boxConstraints, constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: constraints.maxHeight / 3.7,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: -10,
                bottom: -80,
                child: SizedBox(
                  height: 280,
                  child: Image.asset(
                    ImageConstants.ImageAsset,
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                left: 170,
                bottom: 90,
                child: Text(
                  StringConstants.UtilizeAlcoolGel,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Positioned(
                left: 170,
                bottom: 60,
                child: Text(
                  StringConstants.EviteAglomeracao,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
               Positioned(
                left: 170,
                bottom: 10,
                child: InkWell(
                  onTap: callUrlCovid,
                  child: const Text(
                    'Saiba mais em https://www.saopaulo.sp.leg.br',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
                color: Colors.grey[600],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    lista.state.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  FlagWidget(state: state, height: 40),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
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
  void callUrlCovid() async {
    const url = ServiceConstants.urlPrevencaoCovid;
    if (await launch(url)) {
      await launch(
        url,
        enableJavaScript: true,
        forceWebView: true,
      );
    } else {
      throw ErrorConstants.erroUrlCovid + url;
    }
  }
}
