// Custom ListView
import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/featutre/todo/models/todo.dart';

class ListItemTodo extends StatelessWidget {
  const ListItemTodo({super.key, required this.todo, required this.onRemove});

  // Nhận todo và hàm xóa todo từ widget cha
  final Todo todo;
  // Hàm này sẽ được gọi khi người dùng nhấn nút xóa todo
  // Hàm này sẽ nhận vào id của todo để xóa
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.check_circle), // Icon cho todo
        title: Text(todo.title), // Tiêu đề todo
        subtitle: Text(todo.description), // Mô tả todo
        trailing: IconButton(
          // Nút xóa todo
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => onRemove(todo.id),
        ),
      ),
    );
  }
}
