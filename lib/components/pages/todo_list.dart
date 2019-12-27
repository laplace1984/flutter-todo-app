import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/models/todo.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ToDoBloc>(
      create: (_) => ToDoBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List'),
        ),
        body: _ListView(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<ToDoBloc>(
      builder: (context, bloc, __) {
        return FloatingActionButton(
          // onPressed: bloc.addToDo,
          onPressed: () {
            Navigator.pushNamed(context, 'edit');
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

class _ListView extends StatelessWidget {
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
            // if (i >= snapshot.data.length) {
            //   return Divider();
            // }
            return _buildRow(snapshot.data[i]);
          },
          itemCount: snapshot.data.length,
        );
      },
    );
  }

  Widget _buildRow(ToDo value) {
    return CheckboxListTile(
      title: Text(value.description),
      subtitle: Text(value.createAt.toString()),
      value: value.completed,
      onChanged: _handleOnChanged,
    );
  }

  void _handleOnChanged(bool checked) {
    // no op
  }
}
