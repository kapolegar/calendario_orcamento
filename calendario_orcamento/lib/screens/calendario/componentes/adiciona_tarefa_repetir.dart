import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_alerta_repetirAlerta.dart';
import 'package:flutter/material.dart';

class RepetirTarefa extends StatefulWidget {
  const RepetirTarefa({super.key});

  @override
  State<RepetirTarefa> createState() => _RepetirTarefaState();
}

class _RepetirTarefaState extends State<RepetirTarefa> {
  late String _repeticaoEscolhida;

  @override
  void initState() {
    _repeticaoEscolhida = 'Diariamente';
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
            'assets/icons/repetir.png',
            height: screenSize.height * 0.05,
            width: screenSize.width * 0.06,
          ),
          SizedBox(width: screenSize.width * 0.05),
          Text(
            '$_repeticaoEscolhida    ',
            style: TextStyle(
              color: Formatacao.fonteNegrito,
              fontFamily: 'Montserrat',
              fontSize: screenSize.height * 0.0165,
              fontWeight: FontWeight.w400,
            ),
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
                  builder: (BuildContext context) =>
                      const PersonalizaRepeticao());
            },
            child: Text(
              'Repetir',
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
