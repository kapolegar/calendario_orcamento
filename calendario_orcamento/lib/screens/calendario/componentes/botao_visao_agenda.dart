import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';

class visaoAgendaBotao extends StatelessWidget {
  final dynamic onPressed;
  final String nome;
  const visaoAgendaBotao({
    required this.onPressed,
    required this.nome,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              disabledBackgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(screensize.width * 0.5),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screensize.height * 0.015,
                  horizontal: screensize.width * 0.005),
              child: Container(
                alignment: Alignment.centerLeft,
                width: screensize.width * 0.2,
                child: Text(
                  nome,
                  style: TextStyle(
                      color: Formatacao.fonteDestaque,
                      fontFamily: 'Montserrat',
                      fontSize: screensize.height * 0.018,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ))
      ],
    );
  }
}
