import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_review.dart';
import 'package:Kamataha/src/screens/comment_screen.dart';
import 'package:Kamataha/src/screens/edit_news_screen.dart';
import 'package:Kamataha/src/screens/permission_screen.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/text_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayNews extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;
  final String description;

  const DisplayNews({
    Key? key,
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
    required this.description,
  });

  @override
  _DisplayNewsState createState() => _DisplayNewsState();
}

class _DisplayNewsState extends State<DisplayNews> {
  var isPressed = false;

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
                      "Posted by : Raveena ",
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
                    // child: Text(
                    //   widget.time + " ❤️ " + widget.likes.toString(),
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 10,
                    //   ),
                    // ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SelectableText(
                      widget.currentDescription,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                          wordSpacing: 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditNewsScreen(
                                  currentTitle: widget.currentTitle,
                                  currentDescription: widget.currentDescription,
                                  documentId: widget.documentId,
                                )));
                      },
                      child: const Text("EDIT"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              CustomColors.firebaseOrange)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddReview(
                                  currentDescription: widget.currentDescription,
                                )));
                      },
                      child: const Text("REVIEW"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              CustomColors.firebaseOrange)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Database.deleteNews(
                          docId: widget.documentId,
                        );

                        Navigator.of(context).pop();
                      },
                      child: const Text("DELETE"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              CustomColors.firebaseOrange)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
