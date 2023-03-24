import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_complaint.dart';
import 'package:Kamataha/src/screens/comment_screen.dart';
import 'package:Kamataha/src/screens/complaints.dart';
import 'package:Kamataha/src/screens/edit_item_screen.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/text_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayAllAds extends StatefulWidget {
  final String currentTitle;
  final String currentPrice;
  final String currentLocation;
  final String currentQuantity;
  final String currentPhoneNumber;
  final String currentDescription;
  final String name;
  final String documentId;
  final String time;
  final User _user;
  final String type;
  final String signedUrl;

  const DisplayAllAds(
      {Key? key,
      required this.currentTitle,
      required this.currentPrice,
      required this.currentLocation,
      required this.currentQuantity,
      required this.currentPhoneNumber,
      required this.currentDescription,
      required this.name,
      required this.documentId,
      required this.time,
      required User user,
      this.type = "",
      this.signedUrl = ""})
      : _user = user,
        super(key: key);

  @override
  _DisplayAllAdsState createState() => _DisplayAllAdsState();
}

class _DisplayAllAdsState extends State<DisplayAllAds> {
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
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Container(
                child: Image.network(
                  widget.signedUrl,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Title  : " + widget.currentTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Price   : " + widget.currentPrice,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Location   : " + widget.currentLocation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quantity    : " + widget.currentQuantity,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Phone Number : " + widget.currentPhoneNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Description : " + widget.currentDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
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
                if (widget.type == "all")
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => CommentScreen(
                      //           comment: widget.currentTitle,
                      //         )));
                    },
                    child: const Text("Call"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.firebaseOrange)),
                  ),
                if (widget.type == "all")
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddComplaint(
                                title: widget.currentTitle,
                                user: _user,
                              )));
                    },
                    child: const Text("Add complaint"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.firebaseOrange)),
                  ),
                if (widget.type == "my")
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditItemNewScreen(
                                title: widget.currentTitle,
                                price: widget.currentPrice,
                                location: widget.currentLocation,
                                description: widget.currentDescription,
                                phoneNumber: widget.currentPhoneNumber,
                                quantity: widget.currentQuantity,
                                signedUrl: widget.signedUrl,
                                documentId: widget.documentId,
                                user: widget._user.displayName.toString(),
                              )));
                    },
                    child: const Text("EDIT"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.firebaseOrange)),
                  ),
                if (widget.type == "my")
                  ElevatedButton(
                    onPressed: () async {
                      await Database.deleteAd(
                        docId: widget.documentId,
                      );

                      Navigator.of(context).pop();
                    },
                    child: const Text("DELETE"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.firebaseOrange)),
                  ),
                if (widget.type == "my")
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Complaints(
                                title: widget.currentTitle,
                                user: _user,
                              )));
                    },
                    child: const Text("VIEW COMPLAINT"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.firebaseOrange)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
