import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color.fromARGB(31, 63, 57, 57),Color.fromARGB(255, 64, 14, 78), Color.fromARGB(255, 25, 7, 48)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      )),
      child: Column(
   
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(height: size.height * .3,),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 1),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Icon(Icons.movie_filter,size: 90,shadows: [
            Shadow(color: Colors.blue,offset: Offset(-2,2),blurRadius: .3),

          ]),
        ),
        SizedBox(height: 5,),
        Text("Flutter Movie Demo",style: TextStyle(
          fontFamily: GoogleFonts.getFont("Pacifico").fontFamily,
          fontSize: 26
        ),),
        SizedBox(height: 10,),
        Text("Version 1.0",style: TextStyle(           
          fontSize: 24
        ),),
        
        Spacer(),
        Text("Developed By Saiyi",
        style: TextStyle(
          fontFamily: GoogleFonts.getFont("Dancing Script").fontFamily,
          fontSize: 18,
        ),
        ),
        SizedBox(height: 10,),
        
      ],),
    ));
  }
}
