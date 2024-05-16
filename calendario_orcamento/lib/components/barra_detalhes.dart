import 'package:calendario_orcamento/components/formatacoes.dart';
import 'package:calendario_orcamento/providers/barra_tarefas.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BarraTarefas extends StatefulWidget {
  final List<Widget>? listaTarefas;
  const BarraTarefas({required this.listaTarefas, Key? key}) : super(key: key);

  @override
  State<BarraTarefas> createState() => _BarraTarefasState();
}

class _BarraTarefasState extends State<BarraTarefas> {
  final _controller = DraggableScrollableController();
  final double _dragSensitivity = 600;
  double _sheetPosition = 0.4;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    ProviderTarefas provider = Provider.of<ProviderTarefas>(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: screensize.width, maxHeight: screensize.height * 0.4),
      child: DraggableScrollableSheet(
        initialChildSize: _sheetPosition,
        maxChildSize: 1,
        minChildSize: 0.25,
        expand: true,
        snap: true,
        // snapSizes: const [0.5],
        controller: _controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: BoxDecoration(
                color: Formatacao.backgroundTarefas,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screensize.width * 0.1),
                    topRight: Radius.circular(screensize.width * 0.1))),
            child: Column(
              children: [
                GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _sheetPosition -= details.delta.dy / _dragSensitivity;
                      if (_sheetPosition < 0.25) {
                        _sheetPosition = 0.25;
                      }
                      if (_sheetPosition > 1) {
                        _sheetPosition = 1;
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: screensize.height * 0.05,
                    alignment: Alignment.center,
                    child: Align(
                      child: Container(
                        color: Formatacao.destaqueCalendario,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        width: screensize.width * 0.2,
                        height: screensize.height * 0.0025,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screensize.width,
                  height: screensize.height * 0.35,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.listaTarefas!,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
