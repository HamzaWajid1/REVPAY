import 'package:postgres/postgres.dart';

class PostgreConnectionParameters {
  static const String ip = '192.168.1.107';
  static const int port = 5432;
  static const String databaseName = 'postgres';
  static const String username = 'postgres';
  static const String password = 'pgadmin';
  static late PostgreSQLConnection connection;

  static Future<PostgreSQLResult> query(String queryString) async {
    return await connection.query(queryString);
  }

  static void connect() async {
    connection = PostgreSQLConnection(ip, port, databaseName,
        username: username, password: password);
    print('Connection opened!');
    await connection.open();
    print('Connection opened!');
  }

  static void close() async {
    await connection.close();
  }
}
