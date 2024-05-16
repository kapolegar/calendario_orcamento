import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_localizacao_mapa.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AdicionaLocalizacao extends StatefulWidget {
  const AdicionaLocalizacao({super.key});

  @override
  State<AdicionaLocalizacao> createState() => _AdicionaLocalizacaoState();
}

class _AdicionaLocalizacaoState extends State<AdicionaLocalizacao> {
  late String _localizacao;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    print(Geolocator.getCurrentPosition());
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    _localizacao = 'Localização';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.05,
      child: Row(
        //ainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/localizacao.png',
            height: screenSize.height * 0.05,
            width: screenSize.width * 0.05,
          ),
          SizedBox(width: screenSize.width * 0.05),
          TextButton(
            onPressed: () async {
              await _determinePosition();
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const MapaLocalizacao());
            },
            child: Text(
              '$_localizacao',
              style: TextStyle(
                color: Formatacao.fonteNegrito,
                fontFamily: 'Montserrat',
                fontSize: screenSize.height * 0.0165,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
