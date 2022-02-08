import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbookproject/models/favourite.dart';
import 'package:cookbookproject/models/ownrecipe.dart';

class FirestoreService {
  final CollectionReference favouriteCollection =
      FirebaseFirestore.instance.collection('favourites');

  final CollectionReference ownRecipeCollection =
      FirebaseFirestore.instance.collection('ownrecipes');

  Future<void> addFavouriteData(String favouriteName, String favouriteRating,
      String favouritetotalTime) async {
    var docRef = FirestoreService().favouriteCollection.doc();
    print('add docRef:' + docRef.id);

    await favouriteCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': favouriteName,
      'rating': favouriteRating,
      'totalTime': favouritetotalTime
    });
  }

  Future<void> addOwnRecipeData(String OwnRecipeName,
      String OwnRecipeDescription, String OwnRecipetotalTime) async {
    var docRef = FirestoreService().ownRecipeCollection.doc();
    print('add docRef:' + docRef.id);

    await ownRecipeCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': OwnRecipeName,
      'description': OwnRecipeDescription,
      'totalTime': OwnRecipetotalTime
    });
  }

  Future<List<Favourite>> readFavouriteData() async {
    List<Favourite> favouriteList = [];
    QuerySnapshot snapshot = await favouriteCollection.get();

    snapshot.docs.forEach((document) {
      Favourite favourite = Favourite.fromMap(document.data());
      favouriteList.add(favourite);
    });

    print('FavouriteList: $favouriteList');
    return favouriteList;
  }

  Future<List<OwnRecipe>> readOwnRecipeData() async {
    List<OwnRecipe> ownrecipeList = [];
    QuerySnapshot snapshot = await ownRecipeCollection.get();

    snapshot.docs.forEach((document) {
      OwnRecipe ownRecipe = OwnRecipe.fromMap(document.data());
      ownrecipeList.add(ownRecipe);
    });

    print('OwnRecipeList: $ownrecipeList');
    return ownrecipeList;
  }

  Future<void> deleteFavouriteData(String docId) async {
    favouriteCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  }

  Future<void> deleteOwnRecipeData(String docId) async {
    ownRecipeCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  }

  Future<void> updateFavouriteData(String favouriteName, String favouriteRating,
      String favouritetotalTime) async {
    var docRef = FirestoreService().favouriteCollection.doc();
    print('update docRef: ' + docRef.id);
    await favouriteCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'name': favouriteName,
      'rating': favouriteRating,
      'totalTime': favouritetotalTime
    });
  }

  Future<void> updateOwnRecipeData(String OwnRecipeName,
      String OwnRecipeDescription, String OwnRecipetotalTime) async {
    var docRef = FirestoreService().ownRecipeCollection.doc();
    print('update docRef: ' + docRef.id);
    await ownRecipeCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'name': OwnRecipeName,
      'description': OwnRecipeDescription,
      'totalTime': OwnRecipetotalTime
    });
  }

  Future<void> deleteFavouriteDoc() async {
    await favouriteCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  Future<void> deleteOwnRecipeDoc() async {
    await ownRecipeCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
}
