import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';

class loginBotao extends StatelessWidget {
  final dynamic onPressed;
  final String nome;
  const loginBotao({
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
              foregroundColor: const Color(0x00000000),
              //shadowColor: Formatacao.botaoLogin,
              backgroundColor: Formatacao.botaoLogin,
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
                  horizontal: screensize.width * 0.15),
              child: Container(
                alignment: Alignment.center,
                width: screensize.width * 0.35,
                child: Text(
                  nome,
                  style: TextStyle(
                      color: Formatacao.fonteNegrito,
                      fontFamily: 'Montserrat',
                      fontSize: screensize.height * 0.018,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ))
      ],
    );
  }
}
