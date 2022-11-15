import 'package:flutter/material.dart';
import 'package:todo_final/colors.dart';
import 'package:todo_final/todo_item.dart';
import 'package:todo_final/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          toDosWidget(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: inputWidget(),
                  ),
                  addButtonWidget(),
                ],
              ))
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    if (toDo != '') {
      setState(() {
        todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ));
      });
    }
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(
      () {
        _foundToDo = results;
      },
    );
  }

  Widget addButtonWidget() {
    return Container(
        margin: EdgeInsets.only(
          bottom: 20,
          right: 20,
        ),
        child: ElevatedButton(
          child: Text(
            "A D D",
            style: TextStyle(fontSize: 20, fontFamily: 'Louis'),
          ),
          onPressed: () {
            _addToDoItem(_todoController.text);
          },
          style: ElevatedButton.styleFrom(
            primary: tdBrown,
            minimumSize: Size(60, 60),
            elevation: 10,
          ),
        ));
  }

  Widget inputWidget() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        right: 20,
        left: 20,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _todoController,
        decoration: InputDecoration(
          hintText: "Unsa man?",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget toDosWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          searchBox(),
          Expanded(
            child: ListView(
              children: [
                labelWidget(),
                for (ToDo todoo in _foundToDo.reversed)
                  ToDoItem(
                    todo: todoo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget labelWidget() {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 20),
      child: Text(
        'I M O N G  M G A  B U H A T O N O N :',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Louis'),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdGrey,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Gipangita?',
          hintStyle: TextStyle(color: tdGold),
        ),
      ),
    );
  }
}

/*
Widget ToDoLabel() {
  return Expanded(
    child: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            'Listahan ng mga gawainn',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}
*/

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 120,
          width: 300,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/UTS-Photoshop.jpg')))
    ]),
  );
}
