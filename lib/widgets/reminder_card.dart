import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminderapp/bloc/reminder_bloc.dart';
import 'package:reminderapp/model/reminder_model.dart';
import 'package:reminderapp/ui/update.dart';

class ReminderCard extends StatelessWidget {
  final ReminderModel reminder;

  const ReminderCard({Key? key, required this.reminder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reminder.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            reminder.description,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(color: Colors.red),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: BlocBuilder<ReminderBloc, ReminderState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                            icon: const Icon(Icons.edit),
                            label: const Text('Edit'),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        UpdatePage(
                                          reminder: reminder,
                                        )))),
                        TextButton.icon(
                            onPressed: () {
                              context
                                  .read<ReminderBloc>()
                                  .add(DeleteReminder(id: reminder.id));
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text('Remove'))
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
