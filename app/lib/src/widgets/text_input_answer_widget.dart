// ignore_for_file: use_key_in_widget_constructors

import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/answer_screen.dart';
import 'package:Kamataha/src/screens/comment_screen.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: duplicate_ignore
class TextInputAnswerWidget extends StatefulWidget {
  final _user;
  final String title;

  const TextInputAnswerWidget({required User user, required this.title})
      : _user = user;

  @override
  _TextInputAnswerWidgetState createState() => _TextInputAnswerWidgetState();
}

class _TextInputAnswerWidgetState extends State<TextInputAnswerWidget> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  final _addItemFormKey = GlobalKey<FormState>();

  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: TextFormField(
          controller: _answerController,
          style: TextStyle(
            color: CustomColors.firebaseYellow,
          ),
          validator: (value) => Validator.validateField(
                value: _answerController.text,
              ),
          // controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.message),
              labelText: "Type a answer: ✍️ ",
              labelStyle: TextStyle(
                color: CustomColors.firebaseGrey,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                splashColor: Colors.blue,
                tooltip: "Post answer",
                onPressed: () async {
                  if (_addItemFormKey.currentState!.validate()) {
                    await Database.addAnswer(
                        user: _user.displayName.toString(),
                        answer: _answerController.text,
                        title: widget.title);
                    _answerController.clear();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AnswerScreen(answer: widget.title),
                    ));
                  }
                },
              ))),
    );
  }
}
