import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:snap_food/Screens/mapPage.dart';
import 'package:snap_food/components/Gender.dart';
import '../components/User.dart';
import 'mainPage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:snap_food/constants.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   User newUser = User();
   Gender gender;
  var addressList = [];
  Position _currentPosition;
  var personImage = AssetImage(
    'images/white.jpg',
  );
  var manColorButton = Colors.black12;
  var womanColorButton = Colors.black12;
  RegExp regExp = new RegExp("[0-9]{10,11}");
  var _formKey = GlobalKey<FormState>();
  bool _securityPassword = true;
  Icon visIcon = Icon(Icons.visibility_off);
  void getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    print (position);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sign up"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 15),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage :
                        personImage,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextFormField(

                              onSaved: (value){
                                newUser.name = value;
                              },
                              validator: (value){
                                if (value.isEmpty){
                                  return "Enter your name";
                                }
                                else
                                  return null;
                              },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.red[600],
                                    width: 2.0
                                ),
                              ),
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              labelText: 'name',
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child:
                        GestureDetector(
                        onTap: (){
                          setState(() {
                            personImage = AssetImage(
                              'images/userpic.png',
                            );
                            gender = Gender.MALE;
                            manColorButton = Colors.black38;
                            womanColorButton = Colors.black12;
                          });
              },
                child: Container(
                  decoration: BoxDecoration(
                    color: manColorButton,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15) )
                  ),
                  height: 60,
                  width: 40,
                  margin: EdgeInsets.only(left: 5),

                  child: Center(child: Text("male", style: kGenderStyle,)),
                ),
              ),
            ),
                          Expanded(
                            child:
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  gender = Gender.FEMALE;
                                  personImage = AssetImage(
                                    'images/woman-person.jpg',
                                  );
                                  manColorButton = Colors.black12;
                                  womanColorButton = Colors.black38;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  color: womanColorButton,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15) )
                                ),
                                height: 60,
                                width: 30,
                                child: Center(child: Text("female",
                                style: kGenderStyle)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        onSaved: (value){
                          newUser.phoneNumber = value;
                        },
                        validator: (value){
                          if (value.isEmpty){
                            return "Enter Your PhoneNumber";
                          }
                          else if (regExp.hasMatch(value)){
                            return null;
                          }
                          else {
                            return "Invalid PhoneNumber";
                          }
                        },
                        maxLength: 11,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red[600],
                              width: 2.0
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(Icons.call),
                          labelText: 'phoneNumber',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                      child: TextFormField(
                        onSaved: (value){

                        },
                        validator: (value){
                          if (value.isEmpty){
                            return "Enter your address";
                          }
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.red[600],
                                width: 2.0
                            ),
                          ),
                          filled: true,
                          labelText: 'address',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.home_outlined),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
                              });
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ),
                    ), //
                    if (addressList.isNotEmpty)
                      for (var address in addressList)
                        address, // address
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
                      child: TextFormField(
                        onSaved: (value){
                          newUser.userGender = gender;
                          newUser.password = value;
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return "Please Enter Your Password";
                          }
                          else if (value.length < 7){
                            return "length must be more than 6";
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.red[600],
                                width: 2.0
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          filled: true,
                          labelText: 'password',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffix: IconButton(
                            icon: visIcon,
                            onPressed: (){
                              setState(() {
                                if (_securityPassword){
                                  visIcon = Icon(Icons.visibility);
                                }
                                else {
                                  visIcon = Icon(Icons.visibility_off);
                                }
                                _securityPassword = !_securityPassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _securityPassword,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        child: Container(
                          width: 170,
                            height: 50,
                            child: Center(child: Text("create account", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),))
                        ),
                        onPressed: (){
                    setState(() {
                      if (_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage(user: newUser,)),
                        );
                      }
                    });
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}

