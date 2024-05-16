import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/components/routes.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late List<bool> _isSelected;
  late List<Color> _isSelectedColor;
  final List<dynamic> _rotas = [
    Routes().agenda,
    Routes().orcamento,
    Routes().notas,
    Routes().perfil
  ];

  @override
  void initState() {
    _isSelected = [true, false, false, false];
    _isSelectedColor = [
      Formatacao.selecionaDataCalendario,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ];
    super.initState();
  }

  _selecionaItem(int index) {
    Navigator.of(context).pushReplacementNamed(_rotas[index]);
    setState(() {
      _isSelected = [false, false, false, false];
      _isSelected.removeAt(index);
      _isSelected.insert(index, true);
      _isSelectedColor = [
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        Colors.transparent
      ];
      _isSelectedColor.removeAt(index);
      _isSelectedColor.insert(index, Formatacao.selecionaDataCalendario);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Formatacao.backgroundTarefas,
      notchMargin: 5,
      height: screensize.height * 0.08,
      child:
          //BottomNavigationBar(
          //  items: _items,
          //  selectedItemColor: Formatacao.selecionaDataCalendario,
          //),
          Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: screensize.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: screensize.width * 0.07,
                  backgroundColor: _isSelectedColor[0],
                  child: IconButton(
                    isSelected: _isSelected[0],
                    highlightColor: Formatacao.selecionaDataCalendario,
                    splashColor: Formatacao.selecionaDataCalendario,
                    splashRadius: screensize.width * 0.075,
                    iconSize: screensize.width * 0.04,
                    icon: Image.asset(
                      'assets/icons/calendario.png',
                    ),
                    onPressed: () {
                      _selecionaItem(0);
                    },
                  ),
                ),
                CircleAvatar(
                  radius: screensize.width * 0.07,
                  backgroundColor: _isSelectedColor[1],
                  child: IconButton(
                    isSelected: _isSelected[1],
                    highlightColor: Formatacao.selecionaDataCalendario,
                    splashColor: Formatacao.selecionaDataCalendario,
                    splashRadius: screensize.width * 0.075,
                    iconSize: screensize.width * 0.015,
                    icon: Image.asset('assets/icons/money.png'),
                    onPressed: () {
                      _selecionaItem(1);
                    },
                  ),
                ),
                CircleAvatar(
                  radius: screensize.width * 0.07,
                  backgroundColor: _isSelectedColor[2],
                  child: IconButton(
                      isSelected: _isSelected[2],
                      highlightColor: Formatacao.selecionaDataCalendario,
                      splashColor: Formatacao.selecionaDataCalendario,
                      splashRadius: screensize.width * 0.075,
                      iconSize: screensize.width * 0.045,
                      icon: Image.asset('assets/icons/note.png'),
                      onPressed: () {
                        _selecionaItem(2);
                      }),
                ),
                CircleAvatar(
                  radius: screensize.width * 0.07,
                  backgroundColor: _isSelectedColor[3],
                  child: IconButton(
                      isSelected: _isSelected[3],
                      highlightColor: Formatacao.selecionaDataCalendario,
                      splashColor: Formatacao.selecionaDataCalendario,
                      splashRadius: screensize.width * 0.075,
                      iconSize: screensize.width * 0.045,
                      icon: Image.asset('assets/icons/user.png'),
                      onPressed: () {
                        _selecionaItem(3);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
