import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/all_news_screen.dart';
import 'package:Kamataha/src/screens/all_review.dart';
import 'package:Kamataha/src/screens/permission_screen.dart';
import 'package:Kamataha/src/screens/posts.dart';
import 'package:Kamataha/src/screens/questions.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/item_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'add_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          title: AppBarTitle(),
          backgroundColor: CustomColors.firebaseNavy,
          elevation: 0,
          centerTitle: true,
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   backgroundColor: CustomColors.firebaseOrange,
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => AddScreen(user: _user),
        //       ),
        //     );
        //   },
        // ),
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child: Image.asset(
                            "assets/news.jpeg",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const Text(
                          'News',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                          child: Text("view more"),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllNewsScreen(user: _user),
                      ));
                    },
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child: Image.asset(
                            "assets/schemas.jpeg",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const Text(
                          'Schemas',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminDashboard(user: _user),
                      ));
                    },
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child: Image.asset(
                            "assets/articles.jpeg",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const Text(
                          'Articles',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminDashboard(user: _user),
                      ));
                    },
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child: Image.asset(
                            "assets/comment.jpeg",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reviews(user: _user),
                      ));
                    },
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: CustomColors.firebaseOrange,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Permission(),
              ),
            );
          },
        ),
      ),
    );
  }
}
