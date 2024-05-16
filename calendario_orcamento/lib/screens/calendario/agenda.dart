import 'package:calendario_orcamento/components/bottom_bar.dart';
import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/providers/barra_tarefas.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/botao_visao_agenda.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/modelo_tarefa.dart';
import 'package:calendario_orcamento/components/barra_detalhes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'componentes/calendario.dart';

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  final List<Map<String, dynamic>> _tarefasDia = [
    {
      'dataInicial': '05/05/2024',
      'dataFinal': '05/05/2024',
      'tarefasDoDia': [
        {
          'tarefa1': {
            'titulo': 'Reunião com pessoal de UX',
            'horarioInicial': '10:00',
            'horarioFinal': '11:00',
            'alerta': 10,
            'localizacao': 'Porto Alegre',
            'anotacoes': '',
          },
        },
        {
          'tarefa2': {
            'titulo': 'Dentista Dr. Marcelo',
            'horarioInicial': '12:00',
            'horarioFinal': '13:00',
            'alerta': 5,
            'localizacao': 'Porto Alegre',
            'anotacoes': '',
          },
        }
      ]
    },
    {
      'dataInicial': '09/05/2024',
      'dataFinal': '09/05/2024',
      'tarefasDoDia': [
        {
          'tarefa1': {
            'titulo': 'Jantar com pessoal do trabalho',
            'horarioInicial': '23:00',
            'horarioFinal': '23:59',
            'alerta': 10,
            'localizacao': 'Porto Alegre',
            'anotacoes': '',
          },
        },
      ]
    },
    {
      'dataInicial': '11/05/2024',
      'dataFinal': '15/05/2024',
      'tarefasDoDia': [
        {
          'tarefa1': {
            'titulo': 'Viagem para Santa Catarina / Barra da Lagoa',
            'horarioInicial': '13:00',
            'horarioFinal': '18:00',
            'alerta': 10,
            'localizacao': 'Porto Alegre',
            'anotacoes': '',
          },
        },
      ]
    },
  ];

  final List<DateTime> _diasSemana = [
    DateTime.now().subtract(Duration(days: DateTime.now().weekday)),
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 2)),
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 3)),
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 4)),
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 5)),
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 6)),
  ];

  final List<Map<String, dynamic>> opcoes = [
    {'Mensal': CalendarFormat.month},
    {'Semanal': CalendarFormat.week},
    {'Diário': CalendarFormat.week}
  ];
  late String opcaoSelecionada;
  late int indexOpcaoSelecionada;
  late CalendarFormat visaoCalendario;

  List<Widget> _retornaListaTarefas() {
    List<Widget> _listaTarefas = [];

    for (Map<String, dynamic> map in _tarefasDia) {
      _listaTarefas.add(ModeloTarefa(tarefasDia: map));
    }

    return _listaTarefas;
  }

  @override
  void initState() {
    indexOpcaoSelecionada = 0;
    opcaoSelecionada = opcoes[indexOpcaoSelecionada].keys.toList()[0];
    visaoCalendario = opcoes[indexOpcaoSelecionada][opcaoSelecionada];
    super.initState();
  }

  selecionaOpcao() {
    indexOpcaoSelecionada == 2
        ? setState(() {
            indexOpcaoSelecionada = 0;
            opcaoSelecionada = opcoes[indexOpcaoSelecionada].keys.toList()[0];
            visaoCalendario = opcoes[indexOpcaoSelecionada][opcaoSelecionada];
          })
        : setState(() {
            indexOpcaoSelecionada++;
            opcaoSelecionada = opcoes[indexOpcaoSelecionada].keys.toList()[0];
            visaoCalendario = opcoes[indexOpcaoSelecionada][opcaoSelecionada];
          });
  }

  List<Widget> _geraTabelaDiaria(Size screenSize) {
    List<String> listaHoras = List.generate(23, (i) => (i + 1).toString());
    List<Widget> tabela = [
      for (String hora in listaHoras)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Formatacao.destaqueCalendario, width: 1))),
              alignment: Alignment.centerRight,
              width: screenSize.width * 0.04,
              height: screenSize.height * 0.05,
              child: Text(
                hora,
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: screenSize.height * 0.012,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom:
                    BorderSide(color: Formatacao.destaqueCalendario, width: 1),
              )),
              alignment: Alignment.centerLeft,
              // width: screenSize.width * 0.122,
              height: screenSize.height * 0.05,
              width: screenSize.width * 0.85,
              child: Text(
                '',
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: screenSize.height * 0.011,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        )
    ];
    tabela.add(SizedBox(height: screenSize.height * 0.475));
    return tabela;
  }

  List<Widget> _geraTabelaSemanal(Size screenSize) {
    List<String> listaHoras = List.generate(23, (i) => (i + 1).toString());
    List<Widget> tabela = [
      for (String hora in listaHoras)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Formatacao.destaqueCalendario, width: 1))),
              alignment: Alignment.centerRight,
              width: screenSize.width * 0.04,
              height: screenSize.height * 0.05,
              child: Text(
                hora,
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: screenSize.height * 0.012,
                    fontWeight: FontWeight.w500),
              ),
            ),
            for (DateTime data in _diasSemana)
              Container(
                decoration: BoxDecoration(
                  border: _diasSemana.indexOf(data) == 0
                      ? const Border(
                          bottom: BorderSide(
                              color: Formatacao.destaqueCalendario, width: 1),
                        )
                      : const Border(
                          left: BorderSide(
                              color: Formatacao.destaqueCalendario, width: 1),
                          bottom: BorderSide(
                              color: Formatacao.destaqueCalendario, width: 1),
                        ),
                ),
                alignment: Alignment.centerLeft,
                width: screenSize.width * 0.122,
                height: screenSize.height * 0.05,
                child: Text(
                  '',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: screenSize.height * 0.011,
                      fontWeight: FontWeight.w400),
                ),
              ),
          ],
        )
    ];
    tabela.add(SizedBox(height: screenSize.height * 0.475));
    return tabela;
  }

  Widget _geraTabelaCalendario(Size screenSize) {
    Map<String, dynamic> tipoTabela = {
      'Semanal': SizedBox(
        width: screenSize.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: _geraTabelaSemanal(screenSize),
          ),
        ),
      ),
      'Diário': SizedBox(
        width: screenSize.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: _geraTabelaDiaria(screenSize),
          ),
        ),
      ),
      'Mensal': SizedBox(
        width: screenSize.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 2,
              )
            ],
          ),
        ),
        //height: screenSize.height * 0.5,
      )
    };
    return tipoTabela[opcaoSelecionada];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ProviderTarefas provider = Provider.of<ProviderTarefas>(context);

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
              Container(
                height: screenSize.height * 0.05,
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.075,
                    ),
                    visaoAgendaBotao(
                        onPressed: () {
                          selecionaOpcao();
                        },
                        nome: opcaoSelecionada)
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.005,
              ),
              Calendario(
                visaoCalendario: visaoCalendario,
              ),
              SizedBox(
                height: opcaoSelecionada == 'Mensal'
                    ? screenSize.height * 0.4625
                    : screenSize.height * 0.67,
                width: screenSize.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _geraTabelaCalendario(screenSize),
                    Positioned(
                      bottom: 0,
                      child: BarraTarefas(
                        listaTarefas: _retornaListaTarefas(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
