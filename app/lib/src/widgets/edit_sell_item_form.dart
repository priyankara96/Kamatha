import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'custom_form_field.dart';

// ignore: must_be_immutable
class EditSellItemForm extends StatefulWidget {
  final String title;
  final String price;
  final String location;
  final String description;
  final String phoneNumber;
  final String quantity;
  final String signedUrl;
  final String documentId;
  final String user;

  // final FocusNode _titleFocusNode = FocusNode();
  // final FocusNode _priceFocusNode = FocusNode();
  // final FocusNode _locationFocusNode = FocusNode();
  // final FocusNode _quantityFocusNode = FocusNode();
  // final FocusNode _phoneNumberFocusNode = FocusNode();
  // final FocusNode _descriptionFocusNode = FocusNode();

  EditSellItemForm(
      {required this.title,
      required this.price,
      required this.location,
      required this.description,
      required this.phoneNumber,
      required this.quantity,
      required this.signedUrl,
      required this.documentId,
      required this.user});

  @override
  _EditSellItemFormState createState() => _EditSellItemFormState();
}

class _EditSellItemFormState extends State<EditSellItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  late User _user;

  bool _isProcessing = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.title,
    );

    _descriptionController = TextEditingController(
      text: widget.description,
    );

    _priceController = TextEditingController(
      text: widget.price,
    );
    _locationController = TextEditingController(
      text: widget.location,
    );
    _locationController = TextEditingController(
      text: widget.location,
    );
    _quantityController = TextEditingController(
      text: widget.quantity,
    );
    _phoneNumberController = TextEditingController(
      text: widget.phoneNumber,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: ListView(
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Description',
                  hint: 'Enter your item description',
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
                    if (_addItemFormKey.currentState!.validate()) {
                      setState(() {
                        _isProcessing = true;
                      });

                      await Database.editSellItem(
                          title: _titleController.text,
                          price: _priceController.text,
                          location: _locationController.text,
                          quantity: _quantityController.text,
                          phoneNumber: _phoneNumberController.text,
                          description: _descriptionController.text,
                          signedUrl: widget.signedUrl,
                          documentId: widget.documentId,
                          user: widget.user);

                      setState(() {
                        _isProcessing = false;
                      });

                      Navigator.of(context).pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      'Update',
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
