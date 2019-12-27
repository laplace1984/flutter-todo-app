import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/models/todo.dart';

class ToDoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ToDoBloc>(context);

    return StreamBuilder<List<ToDo>>(
      stream: bloc.todos,
      builder: (context, snapshot) {
        if (snapshot.data.length < 1) {
          return Center(
            child: Text('Empty!'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            return _buildRow(i, snapshot.data[i], bloc);
          },
          itemCount: snapshot.data.length,
        );
      },
    );
  }

  Widget _buildRow(int index, ToDo value, ToDoBloc bloc) {
    return CheckboxListTile(
        title: Text(value.description),
        subtitle: Text(value.createAt.toString()),
        value: value.completed,
        onChanged: (bool checked) {
          // update completed flag
          value.completed = checked;
          // notify component via bloc class
          bloc.changeToDo(index, value);
        });
  }
}
