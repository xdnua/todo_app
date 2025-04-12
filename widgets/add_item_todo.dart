import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/featutre/todo/extensions/dialog_extension.dart';
import 'package:lam_quen_flutter/featutre/todo/models/todo.dart';

class AddItemTodo extends StatefulWidget {
  const AddItemTodo({super.key, required this.onAddTodo});

  // Hàm này sẽ được gọi khi người dùng nhấn nút thêm todo
  // Hàm này sẽ nhận vào todo mới được tạo
  final void Function(Todo) onAddTodo;

  @override
  State<AddItemTodo> createState() => _AddItemTodoState();
}

class _AddItemTodoState extends State<AddItemTodo> {
  // Các controller để quản lý trạng thái của các trường nhập liệu
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Giải phóng bộ nhớ của các controller khi widget bị hủy
    _titleController.dispose();
    _descriptionController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  // Hàm này sẽ được gọi khi người dùng nhấn nút thêm todo
  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final todo = Todo(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
      );
      // Gọi hàm onAddTodo từ widget cha và truyền vào todo mới tạo
      widget.onAddTodo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            IconButton(
              // Nút đóng bottom sheet
              onPressed: () => context.pop(),
              icon: Icon(Icons.close),
            ),
            Spacer(),
            IconButton(
              // Nút thêm todo
              onPressed: _submit,
              icon: Icon(Icons.check),
            ),
          ],
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Các trường nhập liệu cho tiêu đề và mô tả todo
              InputField(
                controller: _titleController,
                labelText: "Title",
              ),
              const SizedBox(height: 16),
              InputField(
                controller: _descriptionController,
                labelText: "Description",
              ),
            ],
          ),
        )
      ]),
    );
  }
}

// Custom InputField
class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  // Nhận vào controller và labelText từ widget cha
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:
          controller, // Sử dụng controller để quản lý trạng thái của trường nhập liệu
      decoration: InputDecoration(
        // Thêm decoration cho trường nhập liệu
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        // Hàm được gọi khi người dùng nhấn nút thêm todo
        // Kiểm tra xem trường nhập liệu có hợp lệ hay không
        if (value == null || value.isEmpty) {
          return "Please enter a $labelText";
        }
        return null;
      },
    );
  }
}
