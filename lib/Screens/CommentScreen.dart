import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/components/Restaurant.dart';
import 'package:snap_food/components/User.dart';
class CommentScreen extends StatefulWidget {
  final Restaurant restaurant;
  const CommentScreen({
    Key key,
    this.restaurant,
  }) : super(key: key);
  @override
  _CommentScreenState createState() => _CommentScreenState(restaurant);
}

class _CommentScreenState extends State<CommentScreen> {
  Restaurant restaurant;
_CommentScreenState(Restaurant restaurant){
  this.restaurant = restaurant;
}
var cusColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
          itemCount: restaurant.comments.length,
          itemBuilder: (BuildContext context, int index) {
            if (restaurant.comments[index].score <= 2){
              cusColor = Colors.red;
            }
            else if (restaurant.comments[index].score <= 4){
              cusColor = Colors.green;
            }
            else{
              cusColor = Colors.yellow[800];
            }
            User user = restaurant.comments[index].user;
            return Container(
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundImage: user.personImage,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(user.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      for(int i=0; i < restaurant.comments[index].score;i++)
                        Icon(
                          Icons.star,
                          size: 20,
                          color: cusColor,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text(restaurant.comments[index].text.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
