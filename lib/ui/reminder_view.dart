import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminderapp/bloc/reminder_bloc.dart';
import 'package:reminderapp/ui/Reminder_home.dart';

import 'package:reminderapp/widgets/reminder_card.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderState>(
      bloc: context.read<ReminderBloc>()..add(FetchReminders()),
      builder: (context, state) {
        print(state.reminders);
        var reminderList = state.reminders.toList();
        return Scaffold(
          backgroundColor: Colors.black,
      
          appBar: AppBar(
            title: const Text('Reminder Lists'),
          ),
          body: Builder(builder: (context) {
            if (state.isLoading) {
              return const Center(child: LinearProgressIndicator ( color: Colors.green,));
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      var reminderItems = reminderList[index];

                      return ReminderCard(
                        reminder: reminderItems,
                      );
                    }, childCount: reminderList.length),
                  )
                ],
              );
            }
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => ReminderHome()));
            },
            child: Icon(Icons.edit),
          ),
        );
      },
    );
  }
}
