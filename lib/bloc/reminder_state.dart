part of 'reminder_bloc.dart';

class ReminderState {
  bool isLoading;
  bool isDelete;
  bool isInitial;
  bool isSelectImage;
  bool isUploadImage;

  List<ReminderModel> reminders;

  ReminderState(
      {this.isInitial = true,
      this.isDelete = false,
      this.isLoading = false,
      this.reminders = const [],
      this.isSelectImage=false,
      this.isUploadImage=false,
      
      });

  ReminderState copyWith({
    bool? isLoading,
    bool? isDelete,
    bool? isSelect,
    bool ? isUpload,
    List<ReminderModel>? reminders,
  }) {
    return ReminderState(
      isDelete: isDelete ?? this.isDelete,
      isLoading: isLoading ?? this.isLoading,
      reminders: reminders ?? this.reminders,
      isSelectImage: isSelectImage,
      isUploadImage: isUploadImage,
    );
  }
}
