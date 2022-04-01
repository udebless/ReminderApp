import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:reminderapp/bloc/reminder_bloc.dart';
import 'package:reminderapp/model/reminder_model.dart';
import 'package:reminderapp/ui/reminder_view.dart';
import 'package:reminderapp/widgets/reminder_text_fields.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key, required this.reminder}) : super(key: key);

  final ReminderModel reminder;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController updateDes;
  late TextEditingController updateTitle;

  @override
  void initState() {
    updateDes = TextEditingController(text: widget.reminder.description);
    updateTitle = TextEditingController(text: widget.reminder.title);
    super.initState();
  }

   void dispose() {
    // Clean up the controller when the widget is disposed.
    updateDes.dispose();
    updateTitle.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReminderTextField(
              // initialValue: widget.reminder.title,
              controller: updateTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            ReminderTextField(
              // initialValue: widget.reminder.description,
              controller: updateDes,
            ),
            TextButton.icon(
                onPressed: () {
                  
                  context.read<ReminderBloc>().add(UpdateReminder(
                      title: updateTitle.text,
                      description: updateDes.text,
                      imageUrl: widget.reminder.imageUrl!,
                      id: widget.reminder.id));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ReminderView()));
                },
                icon: const Icon(Icons.update),
                label: const Text('Update'))
          ],
        ),
      ),
    );
  }
}
