// ignore_for_file: use_key_in_widget_constructors

import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/display_all_question.dart';
import 'package:Kamataha/src/screens/display_all.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({required User user}) : _user = user;
  final User _user;
  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readReviews(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No reviews yet",
                style: TextStyle(color: CustomColors.firebaseGrey),
              ),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index].data() as dynamic;
              String docID = snapshot.data!.docs[index].id;
              String description = noteInfo["description"];

              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xFF9CF29A),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      title: Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ));
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }
}
