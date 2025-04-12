// Tạo lớp todo
class Todo {
  final int id;
  final String title;
  final String description;

  Todo({required this.title, required this.description})
      : id = DateTime.now()
            .millisecondsSinceEpoch; // Tạo id duy nhất từ thời gian hiện tại
}
