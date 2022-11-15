import 'package:flutter/material.dart';
import 'package:todo_final/colors.dart';
import 'package:todo_final/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Color(0xFFbda476),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBrown,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              fontFamily: 'Louis',
              fontWeight: FontWeight.w200,
            ),
          ),
          trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: tdDarkBrown, borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: Icon(Icons.delete),
                onPressed: () {
                  onDeleteItem(todo.id);
                },
              )),
        ));
  }
}
