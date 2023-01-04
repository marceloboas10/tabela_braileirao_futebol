import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:brasileirao/models/times.dart';
import 'package:brasileirao/models/titulo.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _time = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_time);

  void addTitulo({Time? time, Titulo? titulo}) {
    time?.titulos.add(titulo!);
    notifyListeners();
  }

  void editTitulo({Titulo? titulo, String? ano, String? campeonato}) {
    titulo?.campeonato = campeonato!;
    titulo?.ano = ano!;
    notifyListeners();
  }

  TimesRepository() {
    _time.addAll([
      Time(
          nome: 'Flamengo',
          pontos: 71,
          brasao:
              'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
          cor: Colors.red[900]),
      Time(
        nome: 'Internacional',
        pontos: 70,
        brasao:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Atlético-MG',
        pontos: 68,
        brasao:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        cor: Colors.grey[800],
      ),
      Time(
        nome: 'São Paulo',
        pontos: 66,
        brasao:
            'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Fluminense',
        pontos: 64,
        brasao:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        cor: Colors.teal[800],
      ),
      Time(
        nome: 'Grêmio',
        pontos: 59,
        brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        cor: Colors.blue[900],
      ),
      Time(
        nome: 'Palmeiras',
        pontos: 58,
        brasao:
            'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        cor: Colors.green[800],
      ),
      Time(
        nome: 'Santos',
        pontos: 54,
        brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        cor: Colors.grey[800],
      ),
      Time(
        nome: 'Athletico-PR',
        pontos: 53,
        brasao:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Corinthians',
        pontos: 53,
        brasao:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        cor: Colors.grey[800],
      ),
      Time(
        nome: 'Bragantino',
        pontos: 52,
        brasao:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        cor: Colors.grey[800],
      ),
      Time(
        nome: 'Ceará',
        pontos: 51,
        brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        cor: Colors.grey[800],
      ),
      Time(
        nome: 'Atlético-GO',
        pontos: 50,
        brasao:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Sport',
        pontos: 44,
        brasao:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Bahia',
        pontos: 42,
        brasao: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        cor: Colors.blue[900],
      ),
      Time(
        nome: 'Fortaleza',
        pontos: 41,
        brasao:
            'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Vasco',
        pontos: 41,
        brasao:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        cor: Colors.grey[800],
      ),
      Time(
        nome: 'Goiás',
        pontos: 37,
        brasao:
            'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png',
        cor: Colors.green[900],
      ),
      Time(
        nome: 'Coritiba',
        pontos: 35,
        brasao: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        cor: Colors.green[900],
      ),
      Time(
        nome: 'Botafogo',
        pontos: 34,
        brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        cor: Colors.grey[800],
      ),
    ]);
  }
}
