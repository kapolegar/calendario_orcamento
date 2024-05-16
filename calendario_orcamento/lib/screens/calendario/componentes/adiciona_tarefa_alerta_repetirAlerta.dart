import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/screens/calendario/componentes/adiciona_tarefa.dart';
import 'package:flutter/material.dart';

class PersonalizaRepeticao extends StatefulWidget {
  const PersonalizaRepeticao({super.key});

  @override
  State<PersonalizaRepeticao> createState() => _PersonalizaRepeticaoState();
}

class _PersonalizaRepeticaoState extends State<PersonalizaRepeticao> {
  final Map<int, String> _repeticaoAlertas = {
    0: 'Nunca',
    1: 'Diariamente',
    7: 'Semanalmente',
    30: 'Mensalmente',
    360: 'Anualmente',
  };
  late int _valorInicialAlerta;

  @override
  void initState() {
    _valorInicialAlerta = _repeticaoAlertas.keys.toList()[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<String> listaAlertas = _repeticaoAlertas.values.toList();

    return AlertDialog(
        backgroundColor: Formatacao.backgroundTarefas,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: SizedBox(
          height: screenSize.height * 0.5,
          width: screenSize.width * 0.9,
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.09,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.02),
                  child: Text(
                    'REPETIR',
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
                  child: Column(children: [
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
                            value: _repeticaoAlertas.keys.toList()[
                                _repeticaoAlertas.values
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
                  ]),
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
