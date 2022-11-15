class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Buy suka.', isDone: true),
      ToDo(id: '02', todoText: 'Make kinilaw.', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Call a friend.',
      ),
      ToDo(
        id: '04',
        todoText: 'Cook a friend.',
      ),
      ToDo(
        id: '05',
        todoText: 'Kilaw a friend.',
      ),
      ToDo(
        id: '06',
        todoText: 'Make suka out of a friend',
      ),
      ToDo(
        id: '06',
        todoText: 'Makes friends with suka',
      ),
    ];
  }
}
