import 'dart:convert';
import 'package:cookbookproject/models/recipe.api.dart';
import 'package:cookbookproject/models/recipe.dart';
import 'package:cookbookproject/recipe_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cookbookproject/services/firebaseauth_service.dart';
import 'package:cookbookproject/navbar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     drawer: NavBar(),
     appBar: AppBar(
       title: Row(
         children: [
         Icon(Icons.restaurant_menu),
         SizedBox(width: 10),
         Text('Cook Book')
       ],
       ),
     ), 
     body: _isLoading
     ? Center(child: CircularProgressIndicator())
     : ListView.builder(
       itemCount: _recipes.length,
       itemBuilder: (context, index) {
         return RecipeCard(
           title: _recipes[index].name, 
           cookTime: _recipes[index].totalTime, 
           rating: _recipes[index].rating.toString(), 
           thumbnailUrl: _recipes[index].images);
       },
       ));
  }
}
