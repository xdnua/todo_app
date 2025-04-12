// Custom extension
import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showCustomSnackbar(String message, {Color? color}) {
    // Hiển thị snackbar với thông báo và màu sắc tùy chọn
    // Nếu không có màu sắc nào được chỉ định, sử dụng màu xanh lá cây mặc định
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? Colors.green,
      ),
    );
  }
}
