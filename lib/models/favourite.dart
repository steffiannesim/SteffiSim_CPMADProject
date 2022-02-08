class Favourite {
  String uid;
  String name;
  String rating;
  String totalTime;

  Favourite({this.uid, this.name, this.rating, this.totalTime});

  Favourite.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    rating = data['rating'];
    totalTime = data['totalTime'];
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'name': name, 'rating': rating, 'totalTime': totalTime};
  }
}
