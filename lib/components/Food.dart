import 'package:flutter/cupertino.dart';
import 'package:snap_food/components/Food_Label.dart';
import 'package:snap_food/components/Restaurant.dart';

class Food {
  String name;
  String details;
  Image image;
  int price;
  int id;
  List comments = [];
  Food({String name, String details,this.id ,Image image, int price}){
    this.name = name;
    this.details = details;
    this.price = price;
    this.image = image;
  }
  void setName(String name) {
    this.name = name;
  }

  void setDetails(String details) {
    this.details = details;
  }

  void setPrice(int price) {
    this.price = price;
  }

  String getName() {
    return this.name;
  }

  String getDetails() {
    return this.details;
  }

  int getPrice() {
    return this.price;
  }
}
