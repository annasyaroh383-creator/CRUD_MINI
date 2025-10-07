import 'package:drift/drift.dart';

@DataClassName('Transaction')
class Transaction extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 128)();
  DateTimeColumn get transaction_date => dateTime()();
  IntColumn get Category_id => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatetedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
