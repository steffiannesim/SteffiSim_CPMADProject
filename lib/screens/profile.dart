import 'package:cookbookproject/services/firebaseauth_service.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.green,
          leading: (IconButton(
            icon: Icon(Icons.arrow_back), color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ))
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Email:' + FirebaseAuthService().email(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                'UID:' + FirebaseAuthService().id(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    