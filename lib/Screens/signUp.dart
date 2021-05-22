import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:snap_food/components/Gender.dart';
import '../components/User.dart';
import 'mainPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   User newUser = User();
   Gender g;
  var addressList = [];
  Position _currentPosition;
  var personImage = AssetImage(
    'images/white.jpg',
  );
  var ManColorButton = Colors.yellow[300];
  var WoanColorButton = Colors.yellow[300];
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
          title: Text(" "),
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
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              labelText: 'name',
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),),
                      Expanded(
                        child:
                        GestureDetector(
                        onTap: (){
                          setState(() {
                            personImage = AssetImage(
                              'images/userpic.png',
                            );
                            g = Gender.MALE;
                            ManColorButton = Colors.green[300];
                            WoanColorButton = Colors.yellow[300];
                          });
              },
                child: Container(
                  height: 50,
                  width: 30,
                  margin: EdgeInsets.only(left: 5),
                  color: ManColorButton,
                  child: Center(child: Text("MAN")),
                ),
              ),
            ),
                          Expanded(
                            child:
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  g = Gender.FEMALE;
                                  personImage = AssetImage(
                                    'images/woman-person.jpg',
                                  );
                                  ManColorButton = Colors.yellow[300];
                                  WoanColorButton = Colors.green[300];
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 30,
                                color: WoanColorButton,
                                child: Center(child: Text("WOMAN")),
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
                      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                      child: TextFormField(
                        onSaved: (value){
                          newUser.userGender = g;
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
                    ElevatedButton(
                        child: Text("create account"),
                        onPressed: (){
                    setState(() {
                      if (_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage(user: newUser,)),
                        );
                      };
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

