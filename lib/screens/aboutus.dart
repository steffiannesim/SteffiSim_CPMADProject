import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.green,
          leading: (IconButton(
            icon: Icon(Icons.arrow_back), color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ))
        ),
        // ignore: missing_required_param
        body: ContactUs(
          tagLine: ('This App is meant to be able to look for recipes wherever you are'),
          website: 'steffiannesim@wixsite.com',
          email: 'steffiannesim@fms.com',
          companyName: 'Cook Book',
          cardColor: Colors.green,
          phoneNumber: '+6587828814',
        ),
      ),
    );
  }
}