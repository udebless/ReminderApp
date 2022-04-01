import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:reminderapp/model/reminder_model.dart';

final ImagePicker _picker = ImagePicker();
File? file;

FirebaseFirestore database = FirebaseFirestore.instance;
final reminderRef =
    database.collection('reminder').withConverter<ReminderModel>(
          fromFirestore: (snapshots, _) =>
              ReminderModel.fromJson(snapshots.data()!),
          toFirestore: (reminder, _) => reminder.toJson(),
        );

class ReminderServices {
  Future<List<ReminderModel>> getAllReminder() async {
    var remind = await reminderRef.get();
    return remind.docs.map((e) => e.data()).toList();
  }

  Future<ReminderModel> updateReminder({
    required String title,
    required String description,
    required String id,
    required String imageUrl,
  }) async {
    var url = uploadImage();
    await reminderRef
        .doc(id)
        .update({'description': description, 'title': title, 'imageUrl': url});
    return ReminderModel(id: id, title: title, description: description);
  }

  Future<ReminderModel> createReminder({
    required String title,
    required String description,
    required String imageUrl,
  }) async {
    var url = await uploadImage();
    var id = DateTime.now().microsecondsSinceEpoch.toString();
    var data = ReminderModel(
        id: id, title: title, description: description, imageUrl: url);
    await reminderRef.doc(id).set(data);
    return data;
  }

  void deleteReminder({String? id}) {
    reminderRef.doc(id).delete();
  }

  Future<File?> displayImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) {
      throw ' No file picked';
    }

    return file = File(pickedFile.path);
  }

  Future<String> uploadImage() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      var firebaseStorage = await storage.ref().child('upload').putFile(file!);
      var downloadUrl = await firebaseStorage.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      rethrow;
    }

//    //  Create a reference to the location you want to upload to in firebase

//     var firebaseStorage = await storage.ref().child('upload');

// //Upload the file to firebase
//      var uploadtask = firebaseStorage.putFile(file!);

//      var downloadURL = await uploadtask.ref.getDownloadURL();
  }
}
