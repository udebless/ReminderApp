import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reminderapp/model/reminder_model.dart';
import 'package:reminderapp/services/reminder_services.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderState()) {
    on<ReminderEvent>((event, emit) async {
      if (event is FetchReminders) {
        emit(state.copyWith(isLoading: true));

        var reminders = await ReminderServices().getAllReminder();
        emit(state.copyWith(reminders: reminders, isLoading: false));
      }
      if (event is UpdateReminder) {
        var reminders = state.reminders;

        var update = await ReminderServices().updateReminder(
            imageUrl: event.imageUrl,
            title: event.title,
            id: event.id,
            description: event.description);
        var index = reminders.indexWhere((reminder) => reminder.id == event.id);
        reminders[index] = update;
        emit(state.copyWith(
          reminders: reminders,
        ));
      }

      if (event is DeleteReminder) {
        print('delete');
        var reminders = state.reminders;
        ReminderServices().deleteReminder(id: event.id);
        reminders.removeWhere((element) => element.id == event.id);
        // print(reminders);
        emit(state.copyWith(reminders: reminders));
      }

      if (event is CreateReminder) {
        var reminders = state.reminders;
        var reminder = await ReminderServices().createReminder(
            title: event.title,
            description: event.description,
            imageUrl: event.imageUrl);
        reminders.add(reminder);

        emit(state.copyWith(reminders: reminders));
      }

      if (event is UploadImage) {
        await ReminderServices().uploadImage();

        emit(state.copyWith(isUpload: true));
      }
      if (event is SelectImage) {
        await ReminderServices().displayImage();

        emit(state.copyWith(isSelect: true));
      }
    });
  }
}
