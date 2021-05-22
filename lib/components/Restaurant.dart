import 'package:flutter/cupertino.dart';
import 'package:snap_food/components/Food_Label.dart';

import 'Gender.dart';

class Restaurant {
  String name;
  double score = 4.5;
  int discount = 0;
  List comments = [];
  RestaurantLabel label;
  Image image;
  List favoriteFoodList = [];
  List foodList = [];
  List saladList = [];
  List vegetarianList = [];
  List drinkList = [];


  Restaurant({@required String name,@required Image image,@required List foodList,@required List saladList,@required List vegetarianList, int discount,@required List drinkList,@required RestaurantLabel label}){
    this.name = name;
    this.image = image;
    this.foodList = foodList;
    this.saladList = saladList;
    this.vegetarianList = vegetarianList;
    this.drinkList = drinkList;
    this.discount = discount;
    this.label = label;
  }
  }
