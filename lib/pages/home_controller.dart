import 'package:brasileirao/models/times.dart';
import 'package:brasileirao/repositories/times_repository.dart';

class HomeController {
  late TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}
