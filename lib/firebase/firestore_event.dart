import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/firebase/firestore_user.dart';

import '../model/event.dart';

class FirestoreEvent {
  static CollectionReference<Event> initEventconnection(String userID) {
    var db = FirestoreUser.initconnection().doc(userID);
    var collectionRef = db.collection("events");
    return collectionRef.withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot, _),
      toFirestore: (event, _) => event.toFirestore(),
    );
  }

  static Future<void> addEvents(Event event, String userID) {
    var docmentRef = initEventconnection(userID).doc();
    event.id = docmentRef.id;
    return docmentRef.set(event);
  }
}
