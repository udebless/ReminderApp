import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminderapp/ui/Reminder_home.dart';
import 'package:reminderapp/ui/app.dart';
import 'package:reminderapp/ui/imagedisplay.dart';
import 'package:reminderapp/ui/reminder_landing.dart';
import 'package:reminderapp/ui/reminder_view.dart';
import 'package:reminderapp/widgets/reminder_card.dart';
import 'package:reminderapp/widgets/reminder_text_fields.dart';


import 'bloc/reminder_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return BlocProvider(
      create: (context) => ReminderBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home:  DispalyImage(),
      ),
    );
  }
}
