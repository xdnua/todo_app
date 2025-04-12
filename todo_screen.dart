import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/featutre/todo/extensions/dialog_extension.dart';
import 'package:lam_quen_flutter/featutre/todo/extensions/snackbar_extension.dart';
import 'package:lam_quen_flutter/featutre/todo/models/todo.dart';
import 'package:lam_quen_flutter/featutre/todo/widgets/app_bar_todo.dart';
import 'package:lam_quen_flutter/featutre/todo/widgets/list_item_todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = [];

  void _addTodo(Todo todoItem) {
    // Để mô phỏng việc tạo todo, tạo một dialog loading
    context.showLoadingDialog();

    // Giả lập việc tạo todo trong 2 giây trên server
    Future.delayed(const Duration(seconds: 2), () {
      // Đóng dialog loading và app bar
      context.popTimes(2);

      // Tạo todo mới
      setState(() {
        todos.add(todoItem);
      });

      // Hiển thị snackbar thông báo thêm thành công
      context.showCustomSnackbar('Todo created successfully!');
    });
  }

  void _removeTodo(int id) {
    // Để mô phỏng việc xóa todo, tạo một dialog loading
    context.showLoadingDialog();

    // Giả lập việc xóa todo trong 2 giây trên server
    Future.delayed(const Duration(seconds: 2), () {
      context.pop();

      // Xóa todo dựa trên id
      setState(() {
        todos.removeWhere((todo) => todo.id == id);
      });

      // Hiển thị snackbar thông báo xóa thành công
      context.showCustomSnackbar('Todo deleted successfully!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarTodo(
          onAddTodo: _addTodo), // AppBarTodo là widget chứa nút thêm todo
      body: todos.isEmpty
          ? const Center(
              child: Text(
                  'No todos available!')) // Hiển thị thông báo nếu không có todo nào
          : ListView.builder(
              // Hiển thị danh sách todos
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListItemTodo(
                  todo: todos[index],
                  onRemove: _removeTodo,
                );
              },
            ),
    );
  }
}
