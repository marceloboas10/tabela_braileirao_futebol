import 'package:sqflite/sqflite.dart';
import 'package:brasileirao/repositories/times_repository.dart';
import 'package:brasileirao/models/times.dart';
import 'package:path/path.dart';

class DB {
  //Banco de dados singleton, deixar privado para não tem instanciação externa
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDatabase();
  }

  static get() async {
    return DB.instance.database;
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'dados.db'),
      version: 1,
      onCreate: (db, versao) async {
        await db.execute(times);
        await db.execute(titulos);
        await setupTimes(db);
      },
    );
  }

  setupTimes(db) async {
    for (Time time in TimesRepository.setupTimes()) {
      await db.insert('times', {
        'nome': time.nome,
        'brasao': time.brasao,
        'pontos': time.pontos,
        'cor': time.cor.toString().replaceAll('Color(', '').replaceAll(')', '')
      });
    }
  }

  String get times => '''
    CREATE TABLE times(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      pontos INTEGER,
      brasao TEXT,
      cor TEXT
    );
  ''';

  String get titulos => '''
    CREATE TABLE titulos(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      campeonato TEXT,
      ano TEXT,
      time_id INTEGER,
      FOREIGN KEY (time_id) REFERENCES times(id) ON DELETE CASCADE
    );
  ''';
}
