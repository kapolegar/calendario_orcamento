import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  final CalendarFormat visaoCalendario;
  const Calendario({required this.visaoCalendario, super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  final List<String> meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junhi',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];
  final List<String> diasSemana = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
  DateTime _dataEscolhida = DateTime.now();

  //Color corDestaque() {
  //  _dataEscolhida.weekday ==
  //  return Color.fromRGBO(215, 142, 0, 10);
  //}

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Container(
      width: screensize.width * 0.9,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: screensize.width * 0.87,
            // height: screensize.height * 0.42,
            child: TableCalendar(
              daysOfWeekHeight: screensize.height * 0.04,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: screensize.height * 0.018,
                    fontWeight: FontWeight.w400),
                weekdayStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: screensize.height * 0.018,
                    fontWeight: FontWeight.w400),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: screensize.height * 0.018,
                    fontWeight: FontWeight.bold),
                titleCentered: true,
                formatButtonVisible: false,
              ),
              locale: 'pt_BR',
              calendarFormat: widget.visaoCalendario,
              firstDay: DateTime.utc(2010, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              onDaySelected: (date, e) {
                setState(() {
                  _dataEscolhida = date;
                });
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: screensize.height * 0.016,
                    fontWeight: FontWeight.w400),
                weekendTextStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: screensize.height * 0.017,
                    fontWeight: FontWeight.normal,
                    color: Formatacao.fonteDestaque),
                todayDecoration: const BoxDecoration(
                    color: Formatacao.destaqueCalendario,
                    shape: BoxShape.circle),
                selectedDecoration: const BoxDecoration(
                    color: Formatacao.selecionaDataCalendario,
                    shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
