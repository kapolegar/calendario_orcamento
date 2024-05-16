import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_alerta_incluir.dart';
import 'package:flutter/material.dart';

class AlertaTarefa extends StatefulWidget {
  const AlertaTarefa({super.key});

  @override
  State<AlertaTarefa> createState() => _AlertaTarefaState();
}

class _AlertaTarefaState extends State<AlertaTarefa> {
  late List<Widget> _alertas;

  @override
  void initState() {
    _alertas = [
      const Text(
        '10 minutos antes',
        style: TextStyle(
          color: Formatacao.fonteNegrito,
          fontFamily: 'Montserrat',
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    ];
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
            'assets/icons/bell.png',
            height: screenSize.height * 0.05,
            width: screenSize.width * 0.06,
          ),
          SizedBox(width: screenSize.width * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _alertas,
          ),
          const Spacer(),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.1)),
              ),
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => Formatacao.splashSelecionaData),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const IncluirNovoAlerta());
            },
            child: Text(
              'Adicionar',
              style: TextStyle(
                color: Formatacao.fonteDestaque,
                fontFamily: 'Montserrat',
                fontSize: screenSize.height * 0.015,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
