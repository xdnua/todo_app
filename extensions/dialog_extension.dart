// Custom extension
import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/featutre/todo/widgets/loading_spinner.dart';

extension DialogExtension on BuildContext {
  void showLoadingDialog() {
    // Hiển thị dialog loading với LoadingSpinner
    showDialog(
      context: this,
      builder: (_) => const LoadingSpinner(),
      barrierDismissible: false,
    );
  }

  void pop() {
    // Đóng dialog hiện tại
    Navigator.of(this).pop();
  }

  void popTimes(int times) {
    // Đóng dialog hiện tại và các dialog trước đó
    // times là số lần muốn đóng dialog
    int count = 0;
    Navigator.of(this).popUntil((_) => count++ >= times);
  }
}
