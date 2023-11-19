import 'dart:io';

import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/createAccountPage/validators/validators.dart';
import 'package:expense_manager/view/createAccountPage/widgets/text_form_field.dart';
import 'package:expense_manager/view/homeScreen/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/userController/user_controller.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({
    super.key,
    required this.name,
    required this.phone,
    required this.age,
    required this.email,
    required this.imageUrl,
  });

  final String name;
  final String phone;
  final String age;
  final String email;
  final String imageUrl;

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final _formKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _ageController.text = widget.age;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: height,
                width: width,
              ),
              Positioned(
                top: height * 0.1,
                left: 0,
                right: 0,
                child: Center(
                    child: Obx(
                  () => CircleAvatar(
                      radius: height * 0.08,
                      backgroundImage: userController.imagePath.value.isEmpty
                          ? FileImage(File(widget.imageUrl))
                          : FileImage(File(userController.imagePath.value))),
                )),
              ),
              Positioned(
                top: height * 0.28,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Edit Your Account',
                    style: GoogleFonts.openSans(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.35,
                left: 0,
                right: 0,
                child: Center(
                  child: UserTextfield(
                    label: 'Name',
                    prefix: const Icon(
                      Icons.abc,
                      color: Pallete.grey,
                    ),
                    controller: _nameController,
                    obscureText: false,
                    validator: nameValidator,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.45,
                left: 0,
                right: 0,
                child: Center(
                  child: UserTextfield(
                    prefix: const Icon(
                      Icons.email,
                      color: Pallete.grey,
                    ),
                    label: 'Email',
                    controller: _emailController,
                    obscureText: false,
                    validator: emailValidator,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.55,
                left: 0,
                right: 0,
                child: Center(
                  child: UserTextfield(
                    prefix: const Icon(
                      Icons.numbers_rounded,
                      color: Pallete.grey,
                    ),
                    label: 'Age',
                    controller: _ageController,
                    obscureText: false,
                    validator: ageValidator,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.65,
                left: 0,
                right: 0,
                child: Center(
                  child: UserTextfield(
                    prefix: const Icon(
                      Icons.phone,
                      color: Pallete.grey,
                    ),
                    label: 'Phone',
                    controller: _phoneController,
                    obscureText: false,
                    validator: phoneValidator,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.75,
                left: 0,
                right: 0,
                child: Center(
                  child: LoginSignUpButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final name = _nameController.text.toString();
                        final phone = _phoneController.text.toString();
                        final email = _emailController.text.toString();
                        final age = _ageController.text.toString();

                        User updated = User(
                            name: name,
                            phone: phone,
                            age: age,
                            email: email,
                            imageUrl: userController.imagePath.toString());
                        userController.updateUser(updated);
                      }
                    },
                    label: 'Save Changes',
                    buttonTextColor: Pallete.white,
                    backgroundColor: Pallete.purple,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.85,
                left: 0,
                right: 0,
                child: Obx(
                  () => TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Select Image Source',
                        middleText: '',
                        confirm: TextButton(
                          onPressed: () {
                            userController.pickUserImageWithCamera();
                            Get.back();
                          },
                          child: const Text('Camera'),
                        ),
                        cancel: TextButton(
                          onPressed: () {
                            userController.pickUserImage();
                            Get.back();
                          },
                          child: const Text('Gallery'),
                        ),
                        onConfirm: () {},
                      );
                    },
                    child: Text(
                      userController.imagePath.isEmpty
                          ? 'Change user image??'
                          : 'Change user image??',
                      style:
                          const TextStyle(color: Pallete.purple, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
