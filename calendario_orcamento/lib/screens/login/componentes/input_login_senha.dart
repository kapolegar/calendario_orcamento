import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';

class inputLoginSenha extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const inputLoginSenha(
      {required this.hint, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Container(
      width: screensize.width * 0.75,
      height: screensize.height * 0.06,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screensize.width * 0.5),
        // ignore: prefer_const_constructors
        color: Formatacao.background,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: screensize.height * 0.015),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Formatacao.fonteNegrito,
            fontSize: screensize.height * 0.014,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screensize.height * 0.015,
            horizontal: screensize.width * 0.075,
          ),
        ),
      ),
    );
  }
}
