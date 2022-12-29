import 'package:flutter/material.dart';
import '../constants/image_constants.dart';
import '../constants/string_constants.dart';

class BottonCard extends StatelessWidget {
  const BottonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bottonCard(context);
  }

   _bottonCard(BuildContext context) {
    return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: MediaQuery.of(context).size.height / 4.3-10,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:  const DecorationImage(
              image: AssetImage(ImageConstants.imageAssetNoticias),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    StringConstants.noticiasTexto,
                    style: TextStyle(fontSize: 16,color: Colors.white),
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
}
