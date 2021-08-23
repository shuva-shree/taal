import 'package:flutter/material.dart';
import 'package:taal/widgets/made_for_you_card.dart';
import 'package:taal/widgets/main_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi, Sam!",
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
    // resizeToAvoidBottomInset: true,
      body:
          SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainCard(),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
              child: Text(
                "Made For You",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
  
            SizedBox(
              height: 180,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  clipBehavior: Clip.hardEdge,
                  // physics: clamped,
                  children: [
                    ForYouCard(
                      imageUrl: "assets/images/image.jpg",
                      cardTitle: "Liked Songs",
                    ),
                    ForYouCard(
                      imageUrl: "assets/images/image2.jpg",
                      cardTitle: "Top Hits",
                    ),
                    ForYouCard(
                      imageUrl: "assets/images/image3.jpg",
                      cardTitle: "Daily Mix",
                    ),
                    ForYouCard(
                      imageUrl: "assets/images/image4.jpg",
                      cardTitle: "New Release",
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
              child: Text(
                "Recently played",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
            
            SizedBox(
              height: 150,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  clipBehavior: Clip.hardEdge,
                  // physics: clamped,
                  children: [
                    RecentlyPlayed(
                        imageUrl: "assets/images/image5.jpg", title: "Jelly"),
                    RecentlyPlayed(
                        imageUrl: "assets/images/image6.jpg", title: "Jelly"),
                    RecentlyPlayed(
                        imageUrl: "assets/images/image7.jpg", title: "Jelly"),
                    RecentlyPlayed(
                        imageUrl: "assets/images/image8.jpg", title: "Jelly")
                  ]),
            ),
          ],
        ),
      ),
      // ),
      // ),
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  final String imageUrl;
  final String title;
  const RecentlyPlayed({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 120,
          width: 120,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.only(
            top: 30,
          ),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
      ],
    );
  }
}
