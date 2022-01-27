import 'package:digital_store/models/character_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLService {
  Database? db;

  Future openDB() async {
    try {
      // Get a location using getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'shopping.db');

      // open the database
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          this.db = db;
          createTables();
        },
      );
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  createTables() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "shop_id INTEGER,"
          "name TEXT,"
          "status TEXT,"
          "image TEXT,"
          "species TEXT,"
          "gender TEXT)";

      await db?.execute(qry);
    } catch (e) {
      return e;
    }
  }

  Future saveRecord(Results data) async {
    await db?.transaction((txn) async {
      var qry =
          'INSERT INTO shopping(name, status, image,species,gender) VALUES("${data.name}",${data.status}, "${data.image}",${data.species},${data.gender})';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  Future getCartList() async {
    try {
      var list = await db?.rawQuery('SELECT * FROM cart_list', []);

      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future addToCart(Results data) async {
    await db?.transaction((txn) async {
      var qry =
          'INSERT INTO cart_list(shop_id, name, status, image,species,gender) VALUES(${data.id},"${data.name}","${data.status}", "${data.image}","${data.species}","${data.gender}")';
      int id1 = await txn.rawInsert(qry);

      return id1;
    });
  }

  Future removeFromCart(int shopId) async {
    var qry = "DELETE FROM cart_list where shop_id = $shopId";
    return await db?.rawDelete(qry);
  }
}
