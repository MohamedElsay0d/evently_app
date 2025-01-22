import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/event_model.dart';

class FirebaseService {
  static Future<void> addEventToFirebase(EventModel event) async {
    final doc = FirebaseFirestore.instance.collection('events');
    event.id = doc.doc().id;
    await doc.add(event.toJson());
    log('Event added to Firebase');
    log(event.toString());
  }
}
