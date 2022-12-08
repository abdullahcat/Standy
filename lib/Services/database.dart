// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // CollectionReference

  final CollectionReference UserCollection =
      FirebaseFirestore.instance.collection("Users");

  //New User Data
  Future updateUserData(String displayName, String profilePicture) async {
    return await UserCollection.doc(uid)
        .set({'Name': displayName, "ProfilePic": profilePicture});
  }

  Stream<QuerySnapshot> get Users {
    return UserCollection.snapshots();
  }
}
