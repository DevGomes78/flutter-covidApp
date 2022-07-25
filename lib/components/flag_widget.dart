import 'package:flutter/material.dart';
class FlagWidget extends StatelessWidget {
double height;
 FlagWidget({
    required this.height,
    required this.state,
  }) ;

  final String? state;

  @override
  Widget build(BuildContext context) {
    return state == 'São Paulo'
        ? Container(height: height, child: Image.asset('images/saopaulo.png'))
        : state == 'Minas Gerais'
        ? Container(height: height, child: Image.asset('images/mg.jpg'))
        : state == 'Paraná'
        ? Container(height: height, child: Image.asset('images/pr.png'))
        : state == 'Rio Grande do Sul'
        ? Container(
        height: height, child: Image.asset('images/rgs.png'))
        : state == 'Rio de Janeiro'
        ? Container(
        height: height, child: Image.asset('images/rj.png'))
        : state == 'Bahia'
        ? Container(
        height: height, child: Image.asset('images/ba.png'))
        : state == 'Santa Catarina'
        ? Container(
        height: height,
        child: Image.asset('images/sc.png'))
        : state == 'Goiás'
        ? Container(
        height: height,
        child: Image.asset('images/sc.png'))
        : state == 'Ceará'
        ? Container(
        height: height,
        child: Image.asset('images/ce.png'))
        : state == 'Espírito Santo'
        ? Container(
        height: height,
        child: Image.asset(
            'images/es.png'))
        : state == 'Pernambuco'
        ? Container(
        height: height,
        child: Image.asset(
            'images/pe.png'))
        : state == 'Distrito Federal'
        ? Container(
        height:height,
        child: Image.asset(
            'images/df.png'))
        : state == 'Pará'
        ? Container(
        height: height,
        child: Image.asset(
            'images/para.png'))
        : state == 'Mato Grosso'
        ? Container(
        height: height,
        child: Image.asset(
            'images/mt.png'))
        : state == 'Paraíba'
        ? Container(
        height: height,
        child: Image
            .asset(
            'images/pb.png'))
        : state ==
        'Amazonas'
        ? Container(
        height:
        height,
        child: Image.asset(
            'images/am.png'))
        : state ==
        'Mato Grosso do Sul'
        ? Container(
        height:
        height,
        child: Image.asset(
            'images/mts.png'))
        : state ==
        'Rio Grande do Norte'
        ? Container(
        height: height,
        child: Image.asset('images/rgn.png'))
        : state == 'Maranhão'
        ? Container(height: height, child: Image.asset('images/ma.png'))
        : state == 'Rondônia'
        ? Container(height: height, child: Image.asset('images/ro.png'))
        : state == 'Piauí'
        ? Container(height: height, child: Image.asset('images/pi.png'))
        : state == 'Sergipe'
        ? Container(height: height, child: Image.asset('images/se.png'))
        : state == 'Tocantins'
        ? Container(height: height, child: Image.asset('images/to.png'))
        : state == 'Alagoas'
        ? Container(height: height, child: Image.asset('images/al.png'))
        : state == 'Amapá'
        ? Container(height: height, child: Image.asset('images/amp.png'))
        : state == 'Roraima'
        ? Container(height: height, child: Image.asset('images/rom.png'))
        : state == 'Acre'
        ? Container(height: height, child: Image.asset('images/acr.png'))
        : const SizedBox(height: 30);
  }
}
