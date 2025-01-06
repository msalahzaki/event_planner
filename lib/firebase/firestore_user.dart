import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/model/user.dart';

class FirestoreUser {
  static CollectionReference<MyUser> initconnection() {
    var db = FirebaseFirestore.instance;
    var collectionRef = db.collection("users");
    return collectionRef.withConverter<MyUser>(
      fromFirestore: (snapshot, _) => MyUser.FromFireStore(snapshot.data()!),
      toFirestore: (User, _) => User.toFireStore(),
    );
  }

  static Future<void> addUser(MyUser user) {
    var docmentRef = initconnection().doc(user.uID);
    return docmentRef.set(user);
  }

  static Future<MyUser?> getUserByID(String id) async {
    var sanpShot = await initconnection().doc(id).get();
    return sanpShot.data();
  }
}
