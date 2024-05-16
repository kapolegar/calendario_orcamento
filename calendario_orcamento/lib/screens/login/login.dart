import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';
import 'componentes/input_login_senha.dart';
import 'componentes/login_botao.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

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
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: screensize.height * 0.025,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screensize.height * 0.1,
            ),
            inputLoginSenha(
              hint: 'Insira seu endereço de email',
              controller: controllerEmail,
            ),
            SizedBox(
              height: screensize.height * 0.03,
            ),
            inputLoginSenha(
              hint: 'Insira sua senha',
              controller: controllerSenha,
            ),
            SizedBox(
              height: screensize.height * 0.03,
            ),
            loginBotao(
                onPressed: () {
                  Navigator.pushNamed(context, '/agenda');
                },
                nome: 'LOGIN'),
            SizedBox(height: screensize.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: screensize.width * 0.1),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                        color: const Color.fromRGBO(166, 109, 0, 100),
                        fontFamily: 'Montserrat',
                        fontSize: screensize.height * 0.02,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
