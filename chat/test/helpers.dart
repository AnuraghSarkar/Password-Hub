import 'package:rethinkdb_dart/rethinkdb_dart.dart';

Future<void> createDb(Rethinkdb r, Connection connection) async {
  await r.dbCreate('test').run(connection).catchError((onError) => {});
  await r.db('test').tableCreate('test').run(connection).catchError((onError) => {});
}

Future<void> cleanDb(Rethinkdb r, Connection connection) async {
  await r.table('users').delete().run(connection).catchError((onError) => {});
}