import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminderapp/bloc/reminder_bloc.dart';
import 'package:reminderapp/model/reminder_model.dart';
import 'package:reminderapp/ui/reminder_view.dart';
import 'package:reminderapp/widgets/reminder_text_fields.dart';

class ReminderHome extends StatefulWidget {

   final ReminderModel reminder;
  ReminderHome({
    Key? key, required this.reminder,
  }) : super(key: key);

  @override
  State<ReminderHome> createState() => _ReminderHomeState();
}

class _ReminderHomeState extends State<ReminderHome> {
  final titleFieldController = TextEditingController();

  final descriptionFieldController = TextEditingController();

  @override
  void dispose() {
    descriptionFieldController.dispose();
    titleFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reminder'),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  const Text(
                    'True success is all about working towards meaningful goals and dreams.',
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReminderTextField(
                    controller: titleFieldController,
                    hinttext: 'Title',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ReminderTextField(
                    controller: descriptionFieldController,
                    hinttext: 'Description',
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.upload_file),
                            label: Text('Upload Image')),
                        ElevatedButton(
                            onPressed: () {
                              context.read<ReminderBloc>().add(
                                    CreateReminder(
                                      description:
                                          descriptionFieldController.text,
                                      title: titleFieldController.text,
                                      imageUrl: widget.reminder.imageUrl!, 
                                    ),
                                  );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ReminderView()));
                            },
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ReminderView()));
                            },
                            child: const Text(
                              'See all reminders',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
