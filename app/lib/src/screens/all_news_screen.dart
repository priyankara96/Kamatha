import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_screen.dart';
import 'package:Kamataha/src/screens/permission_screen.dart';
import 'package:Kamataha/src/widgets/all_add_list.dart';
import 'package:Kamataha/src/widgets/all_news_display_list.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/item_list.dart';
import 'package:Kamataha/src/widgets/my_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _AllNewsScreenState createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        backgroundColor: CustomColors.firebaseNavy,
      ),
      backgroundColor: CustomColors.firebaseNavy,
      body: AllNewsDisplayList(user: _user),
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
    );
  }
}
