import 'package:flutter/material.dart';
import 'mainPage.dart';
import 'signUp.dart';
import 'package:snap_food/Screens/mainPage.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  RegExp regExp = new RegExp("[0-9]{10,11}");
  var _formKey = GlobalKey<FormState>();
  bool _securityPassword = true;
  Icon visIcon = Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[200],
      appBar: AppBar(
      title: Text("SNAP  FOOD",
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
      ),),
        centerTitle: true,
      ),
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(top: 20),
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange[600] , Colors.orange[300]],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                          Icons.fastfood,
                          size: 150.0,
                        ),
                        Text("Welcome To SnapFood!",
                        style: TextStyle(
                          fontFamily: 'Lobster',
                        fontSize: 25.0,
                        letterSpacing: 3.0,
                        ),
                        ),
                        ],
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
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
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 10.0),
                    child: Text("Forgot Password?",
                    style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 18.0,
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(EdgeInsets.only(top: 5,bottom: 5,left: 50,right: 50)),
                      ),
                      onPressed: (){
                        if (_formKey.currentState.validate()){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        };
                      },
                      child: Text("  Login  ",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: MaterialStateProperty.all(EdgeInsets.only(top: 5,bottom: 5,left: 50,right: 50)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text("Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
