import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_myads.dart';
import 'package:Kamataha/src/screens/add_screen.dart';
import 'package:Kamataha/src/widgets/item_list.dart';
import 'package:Kamataha/src/widgets/my_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAdd extends StatefulWidget {
  const MyAdd({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _MyAddState createState() => _MyAddState();
}

class _MyAddState extends State<MyAdd> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: MyAddList(user: _user),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: CustomColors.firebaseOrange,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddMyAdd(user: _user),
            ),
          );
        },
      ),
    );
  }
}
