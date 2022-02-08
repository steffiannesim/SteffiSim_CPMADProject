import 'package:flutter/material.dart';
import 'package:cookbookproject/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  String favouriteName;
  String favouriteRating;
  String favouritetotalTime;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Saving Favourite Recipe'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Recipe Name'),
                  validator: (val) =>
                      val.length == 0 ? "Enter Recipe Name" : null,
                  onSaved: (val) => this.favouriteName = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Recipe Rating'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Recipe Rating' : null,
                  onSaved: (val) => this.favouriteRating = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Recipe TotalTime'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Recipe TotalTime' : null,
                  onSaved: (val) => this.favouritetotalTime = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Save Favourite Recipe'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService()
        .addFavouriteData(favouriteName, favouriteRating, favouritetotalTime);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState

