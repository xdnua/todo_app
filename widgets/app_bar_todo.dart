// Custom AppBar
import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/featutre/todo/models/todo.dart';
import 'package:lam_quen_flutter/featutre/todo/widgets/add_item_todo.dart';

class AppBarTodo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTodo({super.key, required this.onAddTodo});

  // Nút thêm todo được truyền từ widget cha
  // Hàm này sẽ được gọi khi người dùng nhấn nút thêm todo
  final void Function(Todo) onAddTodo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Todo List'), // Tiêu đề của AppBar
      actions: [
        IconButton(
          // Nút thêm todo
          icon: const Icon(Icons.add),
          onPressed: () => showModalBottomSheet(
              // Hàm hành động khi người dùng nhấn nút thêm todo
              context: context,
              builder: (_) => AddItemTodo(onAddTodo: onAddTodo)),
        )
      ],
      backgroundColor: Colors.deepOrange,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
