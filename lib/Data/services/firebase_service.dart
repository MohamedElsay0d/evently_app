import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/event_model.dart';

class FirebaseService {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance.collection('events').withConverter(
            fromFirestore: (docSnapshot, _) =>
                EventModel.fromJson(docSnapshot.data()!),
            toFirestore: (event, _) => event.toJson(),
          );

  static Future<void> addEventToFirebase(EventModel event) async {
    CollectionReference eventsCollection = getEventsCollection();
    event.id = eventsCollection.doc().id;
    await eventsCollection.doc(event.id).set(event);
    log('Event added to Firebase');
  }

  static Future<List<EventModel>> getEventsFromFirebase(String? catId) async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    QuerySnapshot<EventModel> eventsSnapshot;
    if (catId == null) {
      eventsSnapshot = await eventsCollection.orderBy('dateTime').get();
    } else {
      eventsSnapshot = await eventsCollection
          .where('categoryId', isEqualTo: catId)
          .orderBy('dateTime')
          .get();
    }
    return eventsSnapshot.docs.map((doc) => doc.data()).toList();
  }
}
