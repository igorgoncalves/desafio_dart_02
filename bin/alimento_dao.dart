import 'dart:io';

import 'alimento.dart';

class AlimentoDAO {
  // Cria alimento e retorna true caso tenha sucesso e false se falhar
  bool create(Alimento alimento) {
    try {
      final file = File('arquivo.csv');
      String contents;
      if (file.existsSync()) {
        final dadosSalvos = file.readAsStringSync();
        contents = dadosSalvos + '\n' + alimento.toCSV();
      } else {
        contents = alimento.toCSV();
      }
      file.writeAsStringSync(contents);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Retorna lista com todos os alimentos
  List<Alimento> listAll() {
    final alimentos = <Alimento>[];
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var row in dadosSalvos) {
      final novoAlimento = Alimento.fromCSV(row);
      alimentos.add(novoAlimento);
    }

    return alimentos;
  }

  // Retorna alimento com o respectivo código
  Alimento getByCod(String codigo) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var item in dadosSalvos) {
      final columns = item.split(',');
      if (columns[0] == codigo) return Alimento.fromCSV(item);
    }

    return null;
  }

  // Atualiza alimento e retorna com novos valores
  Alimento update(String codigo) {
    throw UnimplementedError();
  }

  // Deleta alimento e retorna true caso tenha sucesso e false se falhar
  bool delete(String codigo) {
    throw UnimplementedError();
  }
}
