import 'package:event_planner/firebase/firestore_event.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class EventProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> eventFilteredList = [];
  List<Event> eventFavoriteList = [];
  int selectedCategory = -1;

  Future<void> getAllEvents() async {
    var snap = await FirestoreEvent.initconnection()
        .orderBy('date')
        .orderBy('time')
        .get();
    eventList = snap.docs.map((doc) {
      // FirestoreEvent.initconnection().doc(doc.id).delete();
      return doc.data();
    }).toList();
    eventFilteredList = eventList;
    notifyListeners();
  }

  Future<void> getEventsByCategory() async {
    if (selectedCategory == -1) {
      getAllEvents();
    } else {
      var snap = await FirestoreEvent.initconnection()
          .where("categoryID", isEqualTo: selectedCategory)
          .orderBy('date')
          .orderBy('time')
          .get();
      eventFilteredList = snap.docs.map((doc) {
        return doc.data();
      }).toList();
      notifyListeners();
    }
  }

  Future<void> getEventsByFavorite() async {
    var snap = await FirestoreEvent.initconnection()
        .where("isFavorite", isEqualTo: true)
        .orderBy('date')
        .orderBy('time')
        .get();
    eventFavoriteList = snap.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void updateDoc(String key, dynamic newValue, String id) async {
    await FirestoreEvent.initconnection()
        .doc(id)
        .update({key: newValue}).timeout(const Duration(seconds: 1),
            onTimeout: () {
      print("sucess");
    }).catchError((error) => print("Failed to update user: $error"));
    getEventsByFavorite();
    getEventsByCategory();
  }

  void changeSelectedcategory(int selectedCategory) {
    this.selectedCategory = selectedCategory;
    getEventsByCategory();
  }
}
