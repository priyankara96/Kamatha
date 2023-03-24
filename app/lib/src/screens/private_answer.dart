import 'package:Kamataha/src/widgets/private_answer_list.dart';
import 'package:Kamataha/src/widgets/private_comment_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PrivateAnswers extends StatefulWidget {
  const PrivateAnswers({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _PrivateAnswersState createState() => _PrivateAnswersState();
}

class _PrivateAnswersState extends State<PrivateAnswers> {
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
        child: PrivateAnswerList(
          user: _user,
        ),
      ),
    );
  }
}
