import 'package:cookbookproject/screens/aboutus.dart';
import 'package:cookbookproject/screens/bmicalculator.dart';
import 'package:cookbookproject/screens/favouritespage.dart';
import 'package:cookbookproject/screens/home_page.dart';
import 'package:cookbookproject/screens/ownreicpe.dart';
import 'package:cookbookproject/screens/profile.dart';
import 'package:cookbookproject/services/firebaseauth_service.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
            ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
         ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Profile()),
              );
              },
          ),
            ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context) =>  About()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourites'),
            onTap: ()  {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => FavouritesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Add Own Recipe'),
            onTap: ()  {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => OwnRecipePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculate BMI'),
            onTap: ()  {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => BMICalculator()),
              );
            },
          ),
          Divider(),
            ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () async {
              await FirebaseAuthService().signOut();
            Navigator.of(context).pushNamed('/login');
            }
          ),
        ],       
        ),
      );
  }
}