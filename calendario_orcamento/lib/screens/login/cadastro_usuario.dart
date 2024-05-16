import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';
import 'componentes/input_login_senha.dart';
import 'componentes/login_botao.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  final TextEditingController controllerConfirmaSenha = TextEditingController();

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
            inputLoginSenha(
              hint: 'Confirme sua senha',
              controller: controllerConfirmaSenha,
            ),
            SizedBox(
              height: screensize.height * 0.03,
            ),
            loginBotao(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                nome: 'CADASTRAR'),
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
