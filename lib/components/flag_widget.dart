import 'package:flutter/material.dart';

class FlagWidget extends StatelessWidget {
  double height;

  FlagWidget({
    Key? key,
    required this.height,
    required this.state,
  }) : super(key: key);

  final String? state;

  @override
  Widget build(BuildContext context) {
    return state == 'São Paulo'
        ? SizedBox(height: height, child: Image.asset('images/saopaulo.png'))
        : state == 'Minas Gerais'
            ? SizedBox(height: height, child: Image.asset('images/mg.jpg'))
            : state == 'Paraná'
                ? SizedBox(height: height, child: Image.asset('images/pr.png'))
                : state == 'Rio Grande do Sul'
                    ? SizedBox(
                        height: height, child: Image.asset('images/rgs.png'))
                    : state == 'Rio de Janeiro'
                        ? SizedBox(
                            height: height, child: Image.asset('images/rj.png'))
                        : state == 'Bahia'
                            ? SizedBox(
                                height: height,
                                child: Image.asset('images/ba.png'))
                            : state == 'Santa Catarina'
                                ? SizedBox(
                                    height: height,
                                    child: Image.asset('images/sc.png'))
                                : state == 'Goiás'
                                    ? SizedBox(
                                        height: height,
                                        child: Image.asset('images/sc.png'))
                                    : state == 'Ceará'
                                        ? SizedBox(
                                            height: height,
                                            child: Image.asset('images/ce.png'))
                                        : state == 'Espírito Santo'
                                            ? SizedBox(
                                                height: height,
                                                child: Image.asset(
                                                    'images/es.png'))
                                            : state == 'Pernambuco'
                                                ? SizedBox(
                                                    height: height,
                                                    child: Image.asset(
                                                        'images/pe.png'))
                                                : state == 'Distrito Federal'
                                                    ? SizedBox(
                                                        height: height,
                                                        child: Image.asset(
                                                            'images/df.png'))
                                                    : state == 'Pará'
                                                        ? SizedBox(
                                                            height: height,
                                                            child: Image.asset(
                                                                'images/para.png'))
                                                        : state == 'Mato Grosso'
                                                            ? SizedBox(
                                                                height: height,
                                                                child: Image.asset(
                                                                    'images/mt.png'))
                                                            : state == 'Paraíba'
                                                                ? SizedBox(
                                                                    height:
                                                                        height,
                                                                    child: Image
                                                                        .asset(
                                                                            'images/pb.png'))
                                                                : state ==
                                                                        'Amazonas'
                                                                    ? SizedBox(
                                                                        height:
                                                                            height,
                                                                        child: Image.asset(
                                                                            'images/am.png'))
                                                                    : state ==
                                                                            'Mato Grosso do Sul'
                                                                        ? SizedBox(
                                                                            height:
                                                                                height,
                                                                            child: Image.asset(
                                                                                'images/mts.png'))
                                                                        : state ==
                                                                                'Rio Grande do Norte'
                                                                            ? SizedBox(
                                                                                height: height,
                                                                                child: Image.asset('images/rgn.png'))
                                                                            : state == 'Maranhão'
                                                                                ? SizedBox(height: height, child: Image.asset('images/ma.png'))
                                                                                : state == 'Rondônia'
                                                                                    ? SizedBox(height: height, child: Image.asset('images/ro.png'))
                                                                                    : state == 'Piauí'
                                                                                        ? SizedBox(height: height, child: Image.asset('images/pi.png'))
                                                                                        : state == 'Sergipe'
                                                                                            ? SizedBox(height: height, child: Image.asset('images/se.png'))
                                                                                            : state == 'Tocantins'
                                                                                                ? SizedBox(height: height, child: Image.asset('images/to.png'))
                                                                                                : state == 'Alagoas'
                                                                                                    ? SizedBox(height: height, child: Image.asset('images/al.png'))
                                                                                                    : state == 'Amapá'
                                                                                                        ? SizedBox(height: height, child: Image.asset('images/amp.png'))
                                                                                                        : state == 'Roraima'
                                                                                                            ? SizedBox(height: height, child: Image.asset('images/rom.png'))
                                                                                                            : state == 'Acre'
                                                                                                                ? SizedBox(height: height, child: Image.asset('images/acr.png'))
                                                                                                                : const SizedBox(height: 30);
  }
}
