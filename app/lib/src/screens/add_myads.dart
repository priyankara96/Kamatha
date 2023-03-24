import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/add_item_form.dart';
import 'package:Kamataha/src/widgets/add_myadd_form.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddMyAdd extends StatefulWidget {
  const AddMyAdd({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<AddMyAdd> createState() => _AddMyAddState();
}

class _AddMyAddState extends State<AddMyAdd> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _quantityFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  late User _user;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

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
              child: AddMyAddForm(
                titleFocusNode: _titleFocusNode,
                priceFocusNode: _priceFocusNode,
                locationFocusNode: _locationFocusNode,
                quantityFocusNode: _quantityFocusNode,
                phoneNumberFocusNode: _phoneNumberFocusNode,
                descriptionFocusNode: _descriptionFocusNode,
                user: _user,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
