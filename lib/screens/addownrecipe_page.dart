import 'package:flutter/material.dart';
import 'package:cookbookproject/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddOwnRecipePage extends StatefulWidget {
  @override
  _AddOwnRecipePageState createState() => _AddOwnRecipePageState();
}

class _AddOwnRecipePageState extends State<AddOwnRecipePage> {
  String OwnRecipeName;
  String OwnRecipeDescription;
  String OwnRecipetotalTime;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saving Recipe Record'), actions: <Widget>[]),
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
                  onSaved: (val) => this.OwnRecipeName = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Recipe Description'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Recipe Description' : null,
                  onSaved: (val) => this.OwnRecipeDescription = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Recipe TotalTime'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Recipe TotalTime' : null,
                  onSaved: (val) => this.OwnRecipetotalTime = val,
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
    FirestoreService().addOwnRecipeData(
        OwnRecipeName, OwnRecipeDescription, OwnRecipetotalTime);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
}
