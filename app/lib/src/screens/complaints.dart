import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_screen.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/complaints_list.dart';
import 'package:Kamataha/src/widgets/item_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Complaints extends StatefulWidget {
  final String title;
  const Complaints({Key? key, required this.title, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
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
        backgroundColor: CustomColors.firebaseNavy,
        title: AppBarTitle(),
      ),
      backgroundColor: CustomColors.firebaseNavy,
      body: ComplaintsList(title: widget.title),
    );
  }
}
