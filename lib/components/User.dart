import 'package:flutter/cupertino.dart';
import 'package:snap_food/components/Gender.dart';

class User{
  String name;
  String phoneNumber;
  Gender userGender;
  var personImage;
  int balance = 0;
  String password;
  List previousOrder = [];
  List activeOrders = [];
  List favoriteRestaurants = [];
  List comments = [];
  User(){
   userGender == Gender.MALE ? personImage =AssetImage(
     'images/userpic.png',
   ) : AssetImage(
     'images/woman-person.jpg',
   );
  }


  //TODO userComments
  //TODO userFavoriteRestaurant
  //TODO address

}