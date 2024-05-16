import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ModeloTarefa extends StatefulWidget {
  final Map<String, dynamic> tarefasDia;
  const ModeloTarefa({required this.tarefasDia, super.key});

  @override
  State<ModeloTarefa> createState() => _ModeloTarefaState();
}

class _ModeloTarefaState extends State<ModeloTarefa> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return SizedBox(
      width: screensize.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screensize.height * 0.04),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screensize.width * 0.015),
              Container(
                width: screensize.width * 0.15,
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EE', "pt_BR")
                          .format(DateFormat("dd/MM/yyyy")
                              .parse(widget.tarefasDia['dataInicial']))
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: screensize.height * 0.018,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      DateFormat('dd')
                          .format(DateFormat("dd/MM/yyyy")
                              .parse(widget.tarefasDia['dataInicial']))
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: screensize.height * 0.035,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (Map<String, dynamic> map
                      in widget.tarefasDia['tarefasDoDia'])
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: screensize.height * 0.008,
                          left: screensize.height * 0.015,
                          right: screensize.height * 0.008),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                map[map.keys.toList()[0]]['horarioInicial'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontSize: screensize.height * 0.016,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: screensize.height * 0.0035),
                              Text(
                                map[map.keys.toList()[0]]['horarioFinal'],
                                style: TextStyle(
                                    color: const Color.fromARGB(132, 0, 0, 0),
                                    fontFamily: 'Montserrat',
                                    fontSize: screensize.height * 0.016,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(width: screensize.width * 0.1),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screensize.width * 0.38,
                                child: Text(
                                  map[map.keys.toList()[0]]['titulo'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: screensize.height * 0.016,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(height: screensize.height * 0.0035),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/localizacao.png',
                                    height: screensize.height * 0.035,
                                    width: screensize.width * 0.035,
                                  ),
                                  SizedBox(width: screensize.width * 0.035),
                                  Text(
                                    map[map.keys.toList()[0]]['localizacao'],
                                    style: TextStyle(
                                        color:
                                            const Color.fromARGB(132, 0, 0, 0),
                                        fontFamily: 'Montserrat',
                                        fontSize: screensize.height * 0.016,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(height: screensize.height * 0.01),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
          SizedBox(height: screensize.height * 0.02),
          Container(
            width: screensize.width * 0.45,
            height: screensize.height * 0.001,
            color: Formatacao.destaqueCalendario,
          ),
        ],
      ),
    );
  }
}
