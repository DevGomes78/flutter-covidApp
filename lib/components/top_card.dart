import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/error_constants.dart';
import '../constants/image_constants.dart';
import '../constants/service_constants.dart';
import '../constants/string_constants.dart';

class TopCard extends StatefulWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return _topCard(context);
  }

  _topCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.7,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: -10,
                bottom: -80,
                child: SizedBox(
                  height: 280,
                  child: Image.asset(
                    ImageConstants.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                left: 130,
                bottom: 130,
                child: Text(
                  StringConstants.useSempreMascara,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                left: 170,
                bottom: 100,
                child: Text(
                  StringConstants.utilizeAlcoolGel,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Positioned(
                left: 170,
                bottom: 70,
                child: Text(
                  StringConstants.eviteAglomeracao,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Positioned(
                left: 170,
                bottom: 10,
                child: InkWell(
                  onTap: callUrlCovid,
                  child: Text(
                    StringConstants.saibaMais + StringConstants.urlCovid,
                    style: TextStyle(
                      fontSize: 12,
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
