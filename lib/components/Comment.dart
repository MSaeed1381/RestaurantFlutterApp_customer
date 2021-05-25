import 'package:snap_food/components/User.dart';

class Comment{
  String text;
  int score;
  String answer;
  User user;
  Comment({this.score, this.text, this.user});
}