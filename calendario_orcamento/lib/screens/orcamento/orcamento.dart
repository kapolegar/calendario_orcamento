import 'package:calendario_orcamento/components/bottom_bar.dart';
import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa.dart';
import 'package:flutter/material.dart';

class Orcamento extends StatefulWidget {
  const Orcamento({super.key});

  @override
  State<Orcamento> createState() => _OrcamentoState();
}

class _OrcamentoState extends State<Orcamento> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => const AdicionaTarefa());
        },
        shape: const CircleBorder(),
        backgroundColor: Formatacao.destaqueCalendario,
        child: const Icon(
          Icons.add_rounded,
          size: 40,
        ),
      ),
      body: Container(
        height: screenSize.height * 0.92,
        width: screenSize.width,
        color: Formatacao.background,
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: screenSize.height * 0.9,
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.0195,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
