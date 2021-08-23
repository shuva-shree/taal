import 'package:flutter/material.dart';

class ForYouCard extends StatelessWidget {
  final String imageUrl;
  final String cardTitle;

  ForYouCard({required this.imageUrl, required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          height: 170,
          width: 150,
          constraints: BoxConstraints(maxWidth: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          //         Color(0xFF181848),
          //         Color(0xFF781878),
          //         Color(0xFFC048A8),
          //       ], stops: [
          //         0.3,
          //         0.75,
          //         1
          //       ]),
          //       backgroundBlendMode: BlendMode.lighten,
          //     ),
          //   ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 130),
          child: Container(
            // padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              color: Color(0xFFC048A8).withOpacity(0.7),
            ),
            alignment: Alignment.center,
            // transform: Matrix4.rotationZ(-0.01),
            height: 40,
            width: 150,
            // color: Color(0xFF781878).withOpacity(0.6),
            child: Text(
              cardTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        // ),
      ],
    );
  }
}
