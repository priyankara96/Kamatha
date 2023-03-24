import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_screen.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/item_list.dart';
import 'package:Kamataha/src/widgets/review_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
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
      body: ReviewList(user: _user),
    );
  }
}
