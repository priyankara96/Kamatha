import 'package:Kamataha/src/widgets/private_item_list.dart';
import 'package:Kamataha/src/widgets/private_question_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PrivateQuestion extends StatefulWidget {
  const PrivateQuestion({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _PrivateQuestionState createState() => _PrivateQuestionState();
}

class _PrivateQuestionState extends State<PrivateQuestion> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 20.0,
        ),
        child: PrivateQuestionList(
          user: _user,
        ),
      ),
    );
  }
}
