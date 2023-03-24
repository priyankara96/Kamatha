import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/all_add.dart';
import 'package:Kamataha/src/screens/my_add.dart';
import 'package:Kamataha/src/screens/posts.dart';
import 'package:Kamataha/src/screens/questions.dart';
import 'package:Kamataha/src/widgets/all_add_list.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/item_list.dart';
import 'package:Kamataha/src/widgets/my_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'add_screen.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<SellerDashboard> {
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
            title: Text(
              "Items",
              style: TextStyle(color: Colors.green),
            ),
            backgroundColor: CustomColors.firebaseNavy,
            elevation: 0,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "All Ads",
                  //icon: Icon(Icons.),
                ),
                Tab(
                  text: "My Ads",
                  //icon: Icon(Icons.question_answer),
                ),
              ],
            )),
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
        body: TabBarView(
          children: [AllAdd(user: _user), MyAdd(user: _user)],
        ),
      ),
    );
  }
}
