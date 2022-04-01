import 'dart:io';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reminderapp/services/reminder_services.dart';

class DispalyImage extends StatefulWidget {
  const DispalyImage({ Key? key }) : super(key: key);

  @override
  State<DispalyImage> createState() => _DispalyImageState();
}

class _DispalyImageState extends State<DispalyImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: (){

              
            },
            child: CircleAvatar(
              backgroundImage: file ==null? const AssetImage('assetName'): FileImage(File(file!.path)) as ImageProvider,

              
              
            ),
          )
        ],
      ),
      
    );
  }
}