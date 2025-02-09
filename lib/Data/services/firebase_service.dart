import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/event_model.dart';
import '../models/user_model.dart';

class FirebaseService {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance.collection('events').withConverter(
            fromFirestore: (docSnapshot, _) =>
                EventModel.fromJson(docSnapshot.data()!),
            toFirestore: (event, _) => event.toJson(),
          );
  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
            fromFirestore: (docSnapshot, _) =>
                UserModel.fromJson(docSnapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  static Future<void> addEventToFirebase(EventModel event) async {
    CollectionReference eventsCollection = getEventsCollection();
    event.id = eventsCollection.doc().id;
    await eventsCollection.doc(event.id).set(event);
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

  static Future<void> deleteEventFromFirebase(EventModel event) async {
    CollectionReference eventsCollection = getEventsCollection();
    await eventsCollection.doc(event.id).delete();
  }

  static Future<void> updateEventToFirebase(EventModel event) async {
    CollectionReference eventsCollection = getEventsCollection();
    await eventsCollection.doc(event.id).update(event.toJson());
  }

  static Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel user = UserModel(
      id: userCredential.user!.uid,
      name: name,
      email: email,
      favoriteEventsId: [],
    );

    CollectionReference<UserModel> usersCollection = getUsersCollection();
    await usersCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentSnapshot<UserModel> donSnapshot =
        await usersCollection.doc(userCredential.user!.uid).get();
    return donSnapshot.data()!;
  }

  static Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  static Future<void> addEventToFavorite(String eventId) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    await usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'favoriteEventsId': FieldValue.arrayUnion([eventId])
    });
  }

  static Future<void> removeEventFromFavorite(String eventId) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    await usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'favoriteEventsId': FieldValue.arrayRemove([eventId])
    });
  }

  static Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in canceled by user');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final CollectionReference<UserModel> usersCollection =
          getUsersCollection();
      final DocumentSnapshot<UserModel> userSnapshot =
          await usersCollection.doc(userCredential.user!.uid).get();

      if (userSnapshot.exists) {
        return userSnapshot.data()!;
      } else {
        final UserModel newUser = UserModel(
          id: userCredential.user!.uid,
          name: googleUser.displayName ?? 'Unknown',
          email: googleUser.email,
          favoriteEventsId: [],
        );
        await usersCollection.doc(userCredential.user!.uid).set(newUser);
        return newUser;
      }
    } catch (e) {
      rethrow;
    }
  }
}
