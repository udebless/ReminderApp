import 'package:flutter/material.dart';
import 'package:reminderapp/ui/Reminder_home.dart';
import 'package:reminderapp/ui/reminder_view.dart';
import 'package:reminderapp/widgets/custom_flat_button.dart';

class ReminderLanding extends StatefulWidget {
  const ReminderLanding({Key? key}) : super(key: key);

  @override
  State<ReminderLanding> createState() => _ReminderLandingState();
}

class _ReminderLandingState extends State<ReminderLanding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/reminderbg.jpeg"), fit: BoxFit.cover)),
      child: Stack(
        children: [
          const Positioned(
              top: 200,
              left: 190,
              child: Icon(
                Icons.alarm,
                color: Colors.blue,
                size: 100,
              )),
          Positioned(
              top: 400,
              left: 150,
              child: CustomFlatButton(
                  buttonName: 'Add reminder',
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => ReminderHome(reminder: remin,)));
                  })),
          Positioned(
              top: 500,
              left: 150,
              child: CustomFlatButton(
                buttonName: 'View all ',
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ReminderView()));
                },
              ))
        ],
      ),
    );
  }
}
