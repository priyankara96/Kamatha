import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/answer_screen.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/text_input_answer_widget.dart';
import 'package:Kamataha/src/widgets/text_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayQuestions extends StatefulWidget {
  final String currentTitle;
  final String currentQuestion;
  final String name;
  final String documentId;
  final String time;
  final int likes;
  final User _user;

  const DisplayQuestions(
      {Key? key,
      required this.currentTitle,
      required this.currentQuestion,
      required this.name,
      required this.documentId,
      required this.time,
      required this.likes,
      required User user})
      : _user = user,
        super(key: key);

  @override
  _DisplayQuestionsState createState() => _DisplayQuestionsState();
}

class _DisplayQuestionsState extends State<DisplayQuestions> {
  late User _user;

  var isPressed = false;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  void showToast(isPressed) {
    if (isPressed) {
      Fluttertoast.showToast(
          msg: 'You Liked This',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    } else {
      Fluttertoast.showToast(
          msg: 'Like Removed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: AppBarTitle(),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          backgroundColor: isPressed ? Colors.red : Colors.green,
          onPressed: () {
            setState(() => isPressed = !isPressed);
            showToast(isPressed);
            if (isPressed) {
              Database.updateLikesQ(
                  likes: widget.likes, docId: widget.documentId);
            } else {
              if (widget.likes == 0) {
                return;
              }
              Database.decrementLikesQ(
                  likes: widget.likes, docId: widget.documentId);
            }
          },
          child: const Icon(Icons.favorite),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Title 👉 " + widget.currentTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Posted by " + widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.time + " ❤️ " + widget.likes.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SelectableText(
                      widget.currentQuestion,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                          wordSpacing: 1),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AnswerScreen(
                              answer: widget.currentTitle,
                            )));
                  },
                  child: const Text("See Answers"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.firebaseOrange)),
                ),
                TextInputAnswerWidget(user: _user, title: widget.currentTitle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
