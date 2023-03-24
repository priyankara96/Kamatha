import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/answerList.dart';
import 'package:Kamataha/src/widgets/list_comments.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key, required this.answer}) : super(key: key);

  final String answer;

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  final String time = DateTime.now().toString().substring(0, 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            Text(
              'Answers for : ',
              style: TextStyle(
                color: CustomColors.firebaseYellow,
                fontSize: 18,
              ),
            ),
            Text(
              widget.answer,
              style: TextStyle(
                color: CustomColors.firebaseOrange,
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () => {_buildDrawer(context)},
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: AnswerList(
            title: widget.answer,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 90, bottom: 5),
        child: Text(
          "Copyright " + time + " ©️" + "Kamatha",
          style: TextStyle(color: CustomColors.firebaseOrange),
        ),
      ),
    );
  }
}
