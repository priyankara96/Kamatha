import 'dart:io';
import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_form_field.dart';

// ignore: must_be_immutable
class AddMyAddForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode priceFocusNode;
  final FocusNode locationFocusNode;
  final FocusNode quantityFocusNode;
  final FocusNode phoneNumberFocusNode;
  final FocusNode descriptionFocusNode;

  const AddMyAddForm({
    Key? key,
    required this.titleFocusNode,
    required this.priceFocusNode,
    required this.locationFocusNode,
    required this.quantityFocusNode,
    required this.phoneNumberFocusNode,
    required this.descriptionFocusNode,
    required User user,
  })  : _user = user,
        super(key: key);

  final User _user;

  @override
  _AddMyAddFormState createState() => _AddMyAddFormState();
}

class _AddMyAddFormState extends State<AddMyAddForm> {
  final _addMyAddFormKey = GlobalKey<FormState>();

  late User _user;

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String signedUrl = "";

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  uploadPic() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images/" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(image!.path));
    uploadTask.then((res) async {
      signedUrl = await res.ref.getDownloadURL().then((value) {
        Fluttertoast.showToast(
            msg: 'File Uploaded Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
        return value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addMyAddFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Text(
                  'Title',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Titlt',
                  hint: 'Enter your title',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Price',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _priceController,
                  focusNode: widget.priceFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Price',
                  hint: 'Enter your price',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Location',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _locationController,
                  focusNode: widget.locationFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Location',
                  hint: 'Enter your location',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Quantity',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _quantityController,
                  focusNode: widget.quantityFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Quantity',
                  hint: 'Enter your quantity',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _phoneNumberController,
                  focusNode: widget.phoneNumberFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Phone Number',
                  hint: 'Enter your item phone number',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Description',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _descriptionController,
                  focusNode: widget.descriptionFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Description',
                  hint: 'Enter your item description',
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadPic();
                  },
                  child: const Text("+ UPLOAD IMAGE"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.firebaseOrange)),
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  ),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors.firebaseOrange,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    widget.titleFocusNode.unfocus();
                    widget.descriptionFocusNode.unfocus();

                    if (_addMyAddFormKey.currentState!.validate()) {
                      setState(() {
                        _isProcessing = true;
                      });

                      await Database.addMyAddsItem(
                          title: _titleController.text,
                          price: _priceController.text,
                          location: _locationController.text,
                          quantity: _quantityController.text,
                          phoneNumber: _phoneNumberController.text,
                          description: _descriptionController.text,
                          user: _user.displayName.toString(),
                          signedUrl: signedUrl);

                      setState(() {
                        _isProcessing = false;
                      });

                      Navigator.of(context).pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      'Post',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.firebaseGrey,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
