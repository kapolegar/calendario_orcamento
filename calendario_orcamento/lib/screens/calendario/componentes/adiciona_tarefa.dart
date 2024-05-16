import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/agenda.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_alerta.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_localizacao.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_repetir.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_seletorData.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa_seletorDataHora.dart';
import 'package:flutter/material.dart';

class AdicionaTarefa extends StatefulWidget {
  const AdicionaTarefa({super.key});

  @override
  State<AdicionaTarefa> createState() => _AdicionaTarefaState();
}

class _AdicionaTarefaState extends State<AdicionaTarefa> {
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerLocalizacao = TextEditingController();
  final TextEditingController _controllerAnotacoes = TextEditingController();
  late Color _corFormatoHora = Formatacao.fonteDestaque;
  late Color _corFormatoTodoODia = Formatacao.selecionaDataCalendario;
  final List<Widget> opcoes = [
    SeletorDataHora(onPressed: () {}),
    SeletorData(onPressed: () {})
  ];
  late Widget opcaoSelecionada;
  late int indexOpcaoSelecionada;

  @override
  void initState() {
    indexOpcaoSelecionada = 0;
    opcaoSelecionada = opcoes[indexOpcaoSelecionada];
    super.initState();
  }

  selecionaOpcao() {
    print(indexOpcaoSelecionada);
    indexOpcaoSelecionada == 1
        ? setState(() {
            indexOpcaoSelecionada = 0;
            opcaoSelecionada = opcoes[indexOpcaoSelecionada];
          })
        : setState(() {
            indexOpcaoSelecionada++;
            opcaoSelecionada = opcoes[indexOpcaoSelecionada];
          });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: Formatacao.backgroundTarefas,
      elevation: 1,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        height: screenSize.height * 0.5,
        width: screenSize.width * 0.9,
        child: Padding(
          padding: EdgeInsets.all(screenSize.height * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controllerTitulo,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: screenSize.width * 0.01),
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: 'Título',
                  hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: screenSize.height * 0.03,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.015,
              ),
              Container(
                width: screenSize.width * 0.5,
                height: screenSize.height * 0.04,
                decoration: BoxDecoration(
                  color: Formatacao.selecionaFormatoTarefaDia,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          _corFormatoHora = Formatacao.fonteDestaque;
                          _corFormatoTodoODia =
                              Formatacao.selecionaDataCalendario;
                        });
                        selecionaOpcao();
                      },
                      //style: ButtonStyle(
                      //    splashFactory: NoSplash.splashFactory,
                      //    overlayColor: null),
                      child: Text(
                        'Hora',
                        style: TextStyle(
                          color: _corFormatoHora,
                          fontFamily: 'Montserrat',
                          fontSize: screenSize.height * 0.016,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: screenSize.height * 0.02,
                      width: screenSize.width * 0.005,
                      color: Formatacao.selecionaDataCalendario,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          _corFormatoHora = Formatacao.selecionaDataCalendario;
                          _corFormatoTodoODia = Formatacao.fonteDestaque;
                        });
                        selecionaOpcao();
                      },
                      child: Text(
                        'Todo o dia',
                        style: TextStyle(
                          color: _corFormatoTodoODia,
                          fontFamily: 'Montserrat',
                          fontSize: screenSize.height * 0.016,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              opcaoSelecionada,
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const AlertaTarefa(),
              const RepetirTarefa(),
              const AdicionaLocalizacao(),
              SizedBox(
                height: screenSize.height * 0.025,
              ),
              SizedBox(
                height: screenSize.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: screenSize.width * 0.33,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const Agenda());
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Formatacao.fonteDestaque,
                            fontFamily: 'Montserrat',
                            fontSize: screenSize.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Formatacao.fonteDestaque,
                        fontFamily: 'Montserrat',
                        fontSize: screenSize.height * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: screenSize.width * 0.33,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const Agenda());
                        },
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            color: Formatacao.fonteDestaque,
                            fontFamily: 'Montserrat',
                            fontSize: screenSize.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
