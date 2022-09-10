import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../data/models/covid_models.dart';
import '../views/description_page.dart';
import 'covid_controller.dart';

class SearchState extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Data>?>(
        future: CovidController().getData(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var lista = snapshot.data![index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        lista.state.toString(),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  data: lista,
                                )));
                      },
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(
        StringConstants.procurar,
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}