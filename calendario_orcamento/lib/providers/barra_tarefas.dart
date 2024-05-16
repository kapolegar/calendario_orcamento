import 'package:flutter/material.dart';

class ProviderTarefas extends ChangeNotifier {
  double _tamanhoBarraTarefas = 0.475;

  double get tamanhoBarraTarefas => _tamanhoBarraTarefas;

  alteraTamanhoBarraTarefas(double tamanho) {
    _tamanhoBarraTarefas = tamanho;
    notifyListeners();
  }
}
