import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import 'login.dart';
import 'signUp.dart';
import 'Gender.dart';
class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState(user);
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  _ProfilePageState(User user){
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[800] , Colors.orange[300]],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: user.userGender == Gender.MALE ? AssetImage(
                      'images/userpic.png',
                    ) : AssetImage(
                      'images/woman-person.jpg',
                    ),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(user.name,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                  ),),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(user.phoneNumber,
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                    ],
                  ),
                ],
              ),
            ),
        Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 25,bottom: 10,left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Change Balance',
                      style:TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ) ,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(user.balance.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                        ),
                        Text("\$",
                        style: TextStyle(
                        fontSize: 25,
                        ),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey[200],
                      min: 0,
                        max: 200,
                        value: user.balance.toDouble(),
                        onChanged: (double newValue){
                      setState(() {
                        user.balance = newValue.toInt();
                      });
                    })
                  ],
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.grey[400],
                    padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                      ),
                      Column(
                        children: [
                          Text('Favorite',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),),
                          Text('Restaurant',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.grey[400],
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.comment,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text('My',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),),
                            Text('Comments',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 150,right: 150,bottom: 10),
                height: 50,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Exit',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
