import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_news.dart';
import 'package:Kamataha/src/utils/adminAuth.dart';
import 'package:Kamataha/src/utils/validator.dart';
import 'package:Kamataha/src/widgets/add_item_form.dart';
import 'package:Kamataha/src/widgets/add_news_form.dart';
import 'package:Kamataha/src/widgets/custom_form_field.dart';
import 'package:Kamataha/src/widgets/list_comments.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Permission extends StatefulWidget {
  const Permission({Key? key}) : super(key: key);

  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  final TextEditingController _managerBudgetTextEditingController =
      TextEditingController();

  final FocusNode fNode = FocusNode();
  bool _isDeleting = false;
  @override
  void initState() {
    super.initState();
  }

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
              'Admin Dashboard : ',
              style: TextStyle(
                color: CustomColors.firebaseYellow,
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
          child: Column(
        children: [
          Center(
              child: Text(
            "Please Enter your Admin Credentials for access to the admin dashboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
          Center(
            child: CustomFormField(
              isLabelEnabled: false,
              controller: _managerBudgetTextEditingController,
              focusNode: fNode,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              validator: (value) => Validator.validateField(
                value: value,
              ),
              label: 'Company Budget',
              hint: 'Enter your access key',
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Submit"),
              onPressed: () async {
                if (Auth.getPermission(
                    _managerBudgetTextEditingController.text)) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AddNews()));
                } else
                  (Fluttertoast.showToast(
                      msg: "Access Key Incorrect",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.yellow));
              },
            ),
          )
        ],
      )),
    );
  }
}
