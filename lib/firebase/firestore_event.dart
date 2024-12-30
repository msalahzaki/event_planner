import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/event.dart';

class FirestoreEvent {
  static CollectionReference<Event> initconnection() {
    var db = FirebaseFirestore.instance;
    var collectionRef = db.collection("events");
    return collectionRef.withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot, _),
      toFirestore: (event, _) => event.toFirestore(),
    );
  }

  static Future<void> addEvents(Event event) {
    var collectionRef = initconnection().doc();
    event.id = collectionRef.id;
    return collectionRef.set(event);
  }
}