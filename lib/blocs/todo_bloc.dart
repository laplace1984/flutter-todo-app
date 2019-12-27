import 'dart:async';

import 'package:todo_app/models/todo.dart';

class ToDoBloc {
  final _valueController = StreamController<List<ToDo>>();
  Stream<List<ToDo>> get todos => _valueController.stream;

  List<ToDo> _todoList = List<ToDo>();

  ToDoBloc() {
    // post initialized value
    // if not call this, snapshot data will be null...
    _valueController.sink.add(_todoList);
  }

  void addToDo() {
    _todoList.add(ToDo(
        id: _todoList.length + 1,
        description: "test ${_todoList.length + 1}",
        createAt: DateTime.now(),
        completed: false));

    _valueController.sink.add(_todoList);
  }

  void dispose() {
    _valueController.close();
  }
}