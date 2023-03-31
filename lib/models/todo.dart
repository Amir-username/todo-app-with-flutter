import 'package:isar/isar.dart';

part 'todo.g.dart';

@Collection()
class  Todo {
  int id = Isar.autoIncrement;
  late String title;

  late DateTime date;

  late String status;

  late bool isDone = false;

  late String description; 
}