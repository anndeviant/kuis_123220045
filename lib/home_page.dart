import 'package:flutter/material.dart';
import 'package:kuis_123220045/login.dart';
import 'package:kuis_123220045/news_item.dart';
import 'package:kuis_123220045/newsmodel.dart';
import 'package:kuis_123220045/profile_page.dart';
import 'package:kuis_123220045/detail_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void _goToDetail(String title, String image, String description, int likes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => DetailPage(
              title: title,
              image: image,
              description: description,
              likes: likes,
            ),
      ),
    );
  }

  void _goToProfile(String username) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(username: widget.username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome, ${widget.username}!",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _goToProfile(widget.username);
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // const Divider(thickness: 1, color: Colors.grey),
                SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Explore News",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 8.0),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children:
                      dummyNews
                          .map(
                            (item) => NewsItem(
                              id: item.id,
                              title: item.title,
                              image: item.image,
                              description: item.description,
                              likes: item.likes,
                              onDetail: _goToDetail,
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
