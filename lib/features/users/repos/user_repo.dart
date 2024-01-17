import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_model.dart';

class UserRepository {
  // gives us access to the database
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final FirebaseStorage _storage =
      FirebaseStorage.instance; // gives us access to Firebase storage

  Future<void> createProfile(UserProfileModel profile) async {
    await _db.collection("users").doc(profile.uid).set(profile.toJson());
  }

  Future<Map<String, dynamic>?> findProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    return doc.data();
  }

  Future<void> uploadAvatar(File file, String fileName) async {
    final fileRef = _storage.ref().child(
        "avatars/$fileName"); // first makes space for a file in the Firebase storage, but there is no file yet
    await fileRef.putFile(file); // this puts the file in Firebase storage
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _db.collection("users").doc(uid).update(data);
  }
}

// exposes the class

final userRepo = Provider((ref) => UserRepository());
