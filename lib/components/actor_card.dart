import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpodv2/models/actor.dart';
import 'package:riverpodv2/utils/myutils.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;

  const ActorCard({required this.actor, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   Column(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover
                ,image:  FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder:
                      "https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg",
                  image: "${bigImageURL}/${actor.profilePath}")
              .image),
            ),
          ),
          Text(actor.name,overflow: TextOverflow.clip,style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.getFont("Anton").fontFamily),textAlign: TextAlign.center,
          ),          
        ],
       
    );
  }
}
