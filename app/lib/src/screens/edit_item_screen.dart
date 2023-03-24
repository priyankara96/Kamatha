import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/widgets/edit_comment_form.dart';
import 'package:Kamataha/src/widgets/edit_sell_item_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditItemNewScreen extends StatefulWidget {
  final String title;
  final String price;
  final String location;
  final String description;
  final String phoneNumber;
  final String quantity;
  final String signedUrl;
  final String documentId;
  final String user;

  // ignore: use_key_in_widget_constructors
  const EditItemNewScreen({
    required this.title,
    required this.price,
    required this.location,
    required this.description,
    required this.phoneNumber,
    required this.quantity,
    required this.signedUrl,
    required this.documentId,
    required this.user
  });

  @override
  _EditItemNewScreenState createState() => _EditItemNewScreenState();
}

class _EditItemNewScreenState extends State<EditItemNewScreen> {
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
                "Edit Item",
                style: TextStyle(
                  color: CustomColors.firebaseYellow,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          centerTitle: true,
          // actions: [
          //   _isDeleting
          //       ? const Padding(
          //           padding: EdgeInsets.only(
          //             top: 10.0,
          //             bottom: 10.0,
          //             right: 16.0,
          //           ),
          //           child: CircularProgressIndicator(
          //             valueColor: AlwaysStoppedAnimation<Color>(
          //               Colors.redAccent,
          //             ),
          //             strokeWidth: 3,
          //           ),
          //         )
          //       : IconButton(
          //           icon: const Icon(
          //             Icons.delete,
          //             color: Colors.redAccent,
          //             size: 32,
          //           ),
          //           onPressed: () async {
          //             setState(() {
          //               _isDeleting = true;
          //             });

          //             await Database.deleteComment(
          //               docId: widget.documentId,
          //             );

          //             setState(() {
          //               _isDeleting = false;
          //             });

          //             Navigator.of(context).pop();
          //           },
          //         ),
          // ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditSellItemForm(
              title: widget.title,
              price: widget.price,
              location: widget.location,
              description: widget.description,
              phoneNumber: widget.phoneNumber,
              quantity: widget.quantity,
              signedUrl: widget.signedUrl,
              documentId: widget.documentId,
              user: widget.user
            ),
          ),
        ),
      ),
    );
  }
}
