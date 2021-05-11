import 'package:flutter/cupertino.dart';
import 'package:snap_food/Gender.dart';

class User{
  String name;
  String phoneNumber;
  Gender userGender;
  var personImage;
  int balance = 0;
  String password;
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