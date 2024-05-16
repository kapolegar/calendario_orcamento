import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa.dart';
import 'package:flutter/material.dart';

class IncluirNovoAlerta extends StatefulWidget {
  const IncluirNovoAlerta({super.key});

  @override
  State<IncluirNovoAlerta> createState() => _IncluirNovoAlertaState();
}

class _IncluirNovoAlertaState extends State<IncluirNovoAlerta> {
  final Map<int, String> _tempoAlertas = {
    0: 'Nenhum',
    1: 'No horário do evento',
    5: '5 minutos antes',
    10: '10 minutos antes',
    15: '15 minutos antes',
    30: '30 minutos antes',
    60: '1 hora antes',
    1440: '1 dia antes',
  };
  late int _valorInicialAlerta;

  @override
  void initState() {
    _valorInicialAlerta = _tempoAlertas.keys.toList()[3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<String> listaAlertas = _tempoAlertas.values.toList();

    return AlertDialog(
        backgroundColor: Formatacao.backgroundTarefas,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: SizedBox(
          height: screenSize.height * 0.5,
          width: screenSize.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height * 0.09,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.02),
                  child: Text(
                    'CRIAR ALERTA',
                    style: TextStyle(
                      color: Formatacao.fonteNegrito,
                      fontFamily: 'Montserrat',
                      fontSize: screenSize.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.34,
                width: screenSize.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (String alerta in listaAlertas)
                        ListTile(
                          dense: true,
                          horizontalTitleGap: screenSize.width * 0.0005,
                          title: Container(
                            alignment: Alignment.centerLeft,
                            height: screenSize.height * 0.02,
                            child: Text(
                              alerta,
                              style: TextStyle(
                                color: Formatacao.fonteNegrito,
                                fontFamily: 'Montserrat',
                                fontSize: screenSize.height * 0.016,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.015,
                            child: Radio(
                              activeColor: Formatacao.fonteDestaque,
                              toggleable: true,
                              value: _tempoAlertas.keys.toList()[_tempoAlertas
                                  .values
                                  .toList()
                                  .indexOf(alerta)],
                              groupValue: _valorInicialAlerta,
                              onChanged: (value) {
                                setState(() {
                                  _valorInicialAlerta = value!;
                                  print(_valorInicialAlerta);
                                });
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.07,
                child: Row(
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
                                  const AdicionaTarefa());
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
                                  const AdicionaTarefa());
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
        ));
  }
}
