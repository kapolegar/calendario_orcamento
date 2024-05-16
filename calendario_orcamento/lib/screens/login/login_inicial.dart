import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';

import 'componentes/login_botao.dart';

class LoginInicial extends StatefulWidget {
  const LoginInicial({super.key});

  @override
  State<LoginInicial> createState() => _loginState();
}

direcionaLogin(context) {}

class _loginState extends State<LoginInicial> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: screensize.height,
        width: screensize.width,
        color: Formatacao.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screensize.height * 0.3,
            ),
            Text(
              'BEM VINDO(A)!',
              style: TextStyle(
                  color: Formatacao.fonteNegrito,
                  fontFamily: 'Montserrat',
                  fontSize: screensize.height * 0.025,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screensize.height * 0.1,
            ),
            loginBotao(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              nome: 'FAZER LOGIN',
            ),
            SizedBox(
              height: screensize.height * 0.03,
            ),
            loginBotao(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              nome: 'CADASTRO',
            ),
          ],
        ),
      ),
    );
  }
}
