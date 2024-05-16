import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeletorDataHora extends StatelessWidget {
  final dynamic onPressed;
  final DateTime _dataInicio = DateTime.now();
  final DateTime _dataFim = DateTime.now();
  var local = DateFormat.Hm('br');

  SeletorDataHora({required this.onPressed, super.key});

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
                'De',
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
                      DateFormat("d 'de' MMMM 'de' y", "pt_BR")
                          .format(_dataInicio),
                      style: TextStyle(
                        color: Formatacao.fonteNegrito,
                        fontFamily: 'Montserrat',
                        fontSize: screensize.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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
                      '${_dataInicio.hour}:00',
                      style: TextStyle(
                        color: Formatacao.fonteNegrito,
                        fontFamily: 'Montserrat',
                        fontSize: screensize.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screensize.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Até',
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
                      DateFormat("d 'de' MMMM 'de' y", "pt_BR")
                          .format(_dataFim),
                      style: TextStyle(
                        color: Formatacao.fonteNegrito,
                        fontFamily: 'Montserrat',
                        fontSize: screensize.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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
                      '${_dataInicio.hour + 1}:00',
                      style: TextStyle(
                        color: Formatacao.fonteNegrito,
                        fontFamily: 'Montserrat',
                        fontSize: screensize.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
