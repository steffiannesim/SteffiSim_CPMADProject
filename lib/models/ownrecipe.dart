class OwnRecipe {
  String uid;
  String name;
  String description;
  String totalTime;

  OwnRecipe({this.uid, this.name, this.description,  this.totalTime});

  OwnRecipe.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    description = data['description'];
    totalTime = data['totalTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'totalTime': totalTime
    };
  }
}
