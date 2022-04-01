part of 'reminder_bloc.dart';

@immutable
abstract class ReminderEvent {}

class FetchReminders extends ReminderEvent {}

class UpdateReminder extends ReminderEvent {
  final String title;
  final String description;
  final String id;
  final String imageUrl;

  UpdateReminder({
    required this.title,
    required this.description,
    required this.id,
    required this.imageUrl,
  });
}

class DeleteReminder extends ReminderEvent {
  final String id;

  DeleteReminder({required this.id});
}

class CreateReminder extends ReminderEvent {
  final String title;
  final String description;
  final String imageUrl;

  CreateReminder({required this.title, required this.description, required this.imageUrl});
}


class UploadImage extends ReminderEvent{
  
}

class SelectImage extends ReminderEvent{


}
