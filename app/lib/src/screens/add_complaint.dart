import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/add_complaint_form.dart';
import 'package:Kamataha/src/widgets/add_item_form.dart';
import 'package:Kamataha/src/widgets/add_question_form.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddComplaint extends StatefulWidget {
  const AddComplaint({Key? key, required this.title, required User user})
      : _user = user,
        super(key: key);

  final User _user;
  final String title;

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _questionFocusNode = FocusNode();

  late User _user;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _questionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: AppBarTitle(),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: AddComplaintForm(
                  titleFocusNode: _titleFocusNode,
                  questionFocusNode: _questionFocusNode,
                  user: _user,
                  title: widget.title),
            ),
          ]),
        ),
      ),
    );
  }
}
