
import 'package:flutter/material.dart';

class TrailerPlayBtn extends StatelessWidget{
  final double height;
  final double width;
  VoidCallback? callBack;
  TrailerPlayBtn({
    required this.height,required this.width,
    this.callBack
  ,super.key});
  @override
  Widget build(BuildContext context) {
     return Container(
                  height: height,
                  width: width,
                  child: Center(
                    child: IconButton(
                        onPressed: callBack,
                        icon: Icon(Icons.play_circle_filled)),
                  ),
                );
  }

}