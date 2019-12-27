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

  void addToDo(ToDo value) {
    _todoList.add(value);
    _valueController.sink.add(_todoList);
  }

    _valueController.sink.add(_todoList);
  }

  void dispose() {
    _valueController.close();
  }
}
