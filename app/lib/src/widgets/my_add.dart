// ignore_for_file: use_key_in_widget_constructors

import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/display_all.dart';
import 'package:Kamataha/src/screens/display_all_ads.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAddList extends StatefulWidget {
  const MyAddList({required User user}) : _user = user;
  final User _user;
  @override
  State<MyAddList> createState() => _MyAddListState();
}

class _MyAddListState extends State<MyAddList> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readMyItems(_user.displayName),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No adds yet",
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
              String title = noteInfo["title"];
              String price = noteInfo["price"];
              String location = noteInfo["location"];
              String quantity = noteInfo["quantity"];
              String phoneNumber = noteInfo["phoneNumber"];
              String description = noteInfo['description'];
              String user = noteInfo['user'];
              String time = noteInfo['time'];
              int likes = noteInfo['likes'];
              String signedUrl = noteInfo["signedUrl"];

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
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayAllAds(
                              currentTitle: title,
                              currentPrice: price,
                              currentLocation: location,
                              currentQuantity: quantity,
                              currentPhoneNumber: phoneNumber,
                              currentDescription: description,
                              documentId: docID,
                              name: user,
                              time: time,
                              user: _user,
                              type: "my",
                              signedUrl: signedUrl),
                        ),
                      ),
                      title: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          
                        ],
                      ),
                      trailing: const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp),
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
