import 'package:flutter/cupertino.dart';

class Restaurant {
  String name;
  double score = 4.5;
  List comments = [];
  Image image;
  List Pizza_List = [];
  List Salad_List = [];
  List Kebab_List = [];
  List Mexican_List = [];
  List Burger_List = [];
  List Sandwich_List = [];
  List Indian_List = [];
  List Vegetarian_List = [];
  List Chinese_List = [];

  Restaurant(
      // ignore: non_constant_identifier_names
      {@required this.name,@required  this.image,@required  this.Burger_List,@required  this.Chinese_List,@required  this.Indian_List,@required  this.Kebab_List,@required  this.Mexican_List,@required  this.Pizza_List,@required  this.Salad_List,@required  this.Sandwich_List,@required  this.Vegetarian_List,});
}