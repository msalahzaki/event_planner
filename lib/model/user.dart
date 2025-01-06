class MyUser {
  final String uID;
  final String name;
  final String email;

  MyUser({required this.uID, required this.name, required this.email});

  Map<String, dynamic> toFireStore() {
    return {"uID": uID, "name": name, "email": email};
  }

  MyUser.FromFireStore(Map<String, dynamic> json)
      : this(email: json["email"], name: json["name"], uID: json["uID"]);
}
