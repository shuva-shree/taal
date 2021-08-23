import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image9.jpg"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(30),
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   colors: [
            //     Color(0xFF181848).withOpacity(0.9),
            //     Color(0xFF781878).withOpacity(0.9),
            //     Color(0xFFC048A8).withOpacity(0.9),
            //   ],
            //   stops: [0.3, 0.75, 1],
            // ),
            // backgroundBlendMode: BlendMode.colorBurn,
          ),
          // child: Image.asset(
          //   "assets/images/image9.jpg",
          //   fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: 50,
          right: 40,
          child: Text(
            "Lenny",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        Positioned(
          bottom: 60,
          right: 35,
          child: Text(
            "Listen Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic
            ),
          ),
        ),
      ],
    );
  }
}