import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_question.dart';
import 'package:Kamataha/src/screens/private_answer.dart';
import 'package:Kamataha/src/screens/private_comments.dart';
import 'package:Kamataha/src/screens/private_feelings.dart';
import 'package:Kamataha/src/screens/private_questions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'add_screen.dart';

class PrivateQuestionScreen extends StatefulWidget {
  const PrivateQuestionScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _PrivateQuestionScreenState createState() => _PrivateQuestionScreenState();
}

class _PrivateQuestionScreenState extends State<PrivateQuestionScreen> {
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
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                Text(
                  _user.displayName.toString().substring(0, 10) + "...'s",
                  style: TextStyle(
                    color: CustomColors.firebaseYellow,
                    fontSize: 18,
                  ),
                ),
                Text(
                  ' Answer ',
                  style: TextStyle(
                    color: CustomColors.firebaseOrange,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            backgroundColor: CustomColors.firebaseNavy,
            elevation: 0,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Questions",
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  text: "Answers",
                  icon: Icon(Icons.comment),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: CustomColors.firebaseOrange,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddQuestions(user: _user),
              ),
            );
          },
        ),
        body: TabBarView(
          children: [
            PrivateQuestion(user: _user),
            PrivateAnswers(user: _user),
          ],
        ),
      ),
    );
  }
}
