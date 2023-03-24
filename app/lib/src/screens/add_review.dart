import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/add_item_form.dart';
import 'package:Kamataha/src/widgets/add_review_form.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddReview extends StatefulWidget {
  const AddReview({Key? key, required this.currentDescription})
      : super(key: key);

  final String currentDescription;
  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

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
              child: AddReviewForm(
                currentDescription: widget.currentDescription,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
