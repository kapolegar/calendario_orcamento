import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeletorData extends StatelessWidget {
  final dynamic onPressed;
  final DateTime _data = DateTime.now();
  SeletorData({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: screensize.width * 0.8,
          height: screensize.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dia',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: screensize.height * 0.016,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screensize.width * 0.1)),
                  ),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Formatacao.splashSelecionaData),
                ),
                onPressed: onPressed,
                child: Row(
                  children: [
                    Text(
                      DateFormat("d 'de' MMMM 'de' y", "pt_BR").format(_data),
                      style: TextStyle(
                        color: Formatacao.fonteNegrito,
                        fontFamily: 'Montserrat',
                        fontSize: screensize.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
