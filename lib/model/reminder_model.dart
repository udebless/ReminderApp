class ReminderModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String? imageUrl;

  ReminderModel(
      {required this.id,
      this.imageUrl,
      required this.title,
      required this.description,
      this.isCompleted = false});

  factory ReminderModel.fromJson(Map json) {
    return ReminderModel(
        id: json['id'], title: json['title'], description: json['description'],
        imageUrl: json['imageUrl'],);
  }
  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl':imageUrl,
    };
  }
}
