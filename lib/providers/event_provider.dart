import 'package:event_planner/firebase/firestore_event.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class EventProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> eventFilteredList = [];
  List<Event> eventFavoriteList = [];
  int selectedCategory = -1;
  Event? event;

  Future<void> getAllEvents(String userID) async {
    var snap = await FirestoreEvent.initEventconnection(userID)
        .orderBy('date')
        .orderBy('time')
        .get();
    eventList = snap.docs.map((doc) {
      return doc.data();
    }).toList();
    eventFilteredList = eventList;
    notifyListeners();
  }

  Future<void> getEventsByCategory(String userID) async {
    if (selectedCategory == -1) {
      getAllEvents(userID);
    } else {
      var snap = await FirestoreEvent.initEventconnection(userID)
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

  Future<void> getEventsByFavorite(String userID) async {
    var snap = await FirestoreEvent.initEventconnection(userID)
        .where("isFavorite", isEqualTo: true)
        .orderBy('date')
        .orderBy('time')
        .get();
    eventFavoriteList = snap.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  Future<void> getEventsById(String userID, String eventID) async {
    var snap =
        await FirestoreEvent.initEventconnection(userID).doc(eventID).get();
    event = snap.data();
    notifyListeners();
  }

  void updateDoc(String key, dynamic newValue, String id, String userID) async {
    await FirestoreEvent.initEventconnection(userID)
        .doc(id)
        .update({key: newValue}).timeout(const Duration(seconds: 1),
            onTimeout: () {
      print("sucess");
    }).catchError((error) => print("Failed to update user: $error"));
    getEventsByFavorite(userID);
    getEventsByCategory(userID);
  }

  void changeSelectedcategory(int selectedCategory, String userID) {
    this.selectedCategory = selectedCategory;
    getEventsByCategory(userID);
  }

  Future<void> deleteEvent(String eventID, String userID) async {
    await FirestoreEvent.initEventconnection(userID).doc(eventID).delete();
    getEventsByFavorite(userID);
    getEventsByCategory(userID);
  }
}
