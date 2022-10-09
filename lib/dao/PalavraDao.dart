import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PalavraDao {
  Future<Database> getDatabase() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), "palavra2_database.db"),
      onCreate: ((db, version) async {
        await db.execute("CREATE TABLE Palavra(id INTEGER PRIMARY KEY, palavra Text)");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('sutil')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('vigor')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('fazer')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('poder')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('moral')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('torpe')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('honra')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('sobre')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('corja')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('prole')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('cobiça')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('mazela')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('eximir')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('buscar')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('receio')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('remoto')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('vulgar')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('avidez')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('defina')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('penhor')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('orgulho')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('contudo')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('oriundo')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('austero')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('alcunha')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('sensato')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('salutar')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('fomento')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('quimera')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('coragem')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('inerente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('peculiar')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('respeito')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('denegrir')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('genocida')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('deferido')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('equidade')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('prudente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('pandemia')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('iminente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('vagabundo')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('diligente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('inusitado')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('nostalgia')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('fidedigno')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('subjetivo')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('discorrer')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('ignorante')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('arrogante')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('cognitivo')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('incipiente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('sororidade')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('disruptivo')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('serenidade')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('indulgente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('preconizar')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('precedente')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('vislumbrar')");
        await db.execute("INSERT INTO Palavra (palavra) VALUES ('lisonjeado')");
        return db.execute("INSERT INTO Palavra (palavra) VALUES ('subestimar')");
      }),
      version: 2
    );

    return db;
  }

  Future<List<String>> readAll() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> maps = await db.query("Palavra");
    
    final result = List.generate(maps.length, (index) {
      return maps[index]['palavra'].toString();
    });
    print(maps);
    return result;
  }
}