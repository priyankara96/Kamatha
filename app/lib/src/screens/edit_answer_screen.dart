import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/widgets/edit_answer_form.dart';
import 'package:Kamataha/src/widgets/edit_comment_form.dart';
import 'package:flutter/material.dart';

class EditAnswerScreen extends StatefulWidget {
  final String currentTitle;
  final String answer;
  final String documentId;
  final String user;

  // ignore: use_key_in_widget_constructors
  const EditAnswerScreen(
      {required this.currentTitle,
      required this.answer,
      required this.documentId,
      required this.user});

  @override
  _EditAnswerScreenState createState() => _EditAnswerScreenState();
}

class _EditAnswerScreenState extends State<EditAnswerScreen> {
  final FocusNode _titleFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
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
                widget.user.toString().substring(0, 10) + "...'s",
                style: TextStyle(
                  color: CustomColors.firebaseYellow,
                  fontSize: 18,
                ),
              ),
              Text(
                ' answer ',
                style: TextStyle(
                  color: CustomColors.firebaseOrange,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteAnswer(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditAnswerForm(
              documentId: widget.documentId,
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              currentTitle: widget.currentTitle,
              answer: widget.answer,
            ),
          ),
        ),
      ),
    );
  }
}
