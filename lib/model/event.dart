import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String title;
  String description;
  int categoryID;
  DateTime date;
  String time;
  bool isFavorite;

  Event(
      {this.id = "",
      required this.title,
      required this.description,
      required this.categoryID,
      required this.date,
      required this.time,
      this.isFavorite = false});

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "categoryID": categoryID,
      "date": date.millisecondsSinceEpoch,
      "time": time,
      "isFavorite": isFavorite
    };
  }

  static Event fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Event(
        id: data?['id'],
        title: data?['title'],
        description: data?['description'],
        categoryID: data?['categoryID'],
        date: DateTime.fromMillisecondsSinceEpoch(data?['date']),
        time: data?['time'],
        isFavorite: data?['isFavorite']);
  }
}
