import 'dart:io';
import 'package:expense_manager/model/repository/userModel/contollers/user_controller.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/login/viewModel/validator/validators.dart';
import 'package:expense_manager/view/home/viewModel/widgets/login_sign_up_button.dart';
import 'package:expense_manager/view/login/viewModel/widgets/size.dart';
import 'package:expense_manager/view/login/viewModel/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
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
    Box userBox = Hive.box<User>('UserBox');
    final userController = Get.put(UserController());
    // final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.scaffoldBgColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Obx(
                    () => Container(
                      child: userController.imagePath.value.isEmpty
                          ? ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title: 'Select Image Source',
                                    middleText: '',
                                    textCancel: 'Camera',
                                    textConfirm: 'Gallery',
                                    onCancel: () {
                                      userController.pickUserImageWithCamera();
                                    },
                                    onConfirm: () {
                                      userController.pickUserImage();
                                      Get.back();
                                    });
                                // userController.pickUserImage();
                              },
                              child: const Text('Add Account Image'),
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.defaultDialog(
                                    title: 'Select Image Source',
                                    middleText: '',
                                    textCancel: 'Camera',
                                    textConfirm: 'Gallery',
                                    onCancel: () {
                                      userController.pickUserImageWithCamera();
                                    },
                                    onConfirm: () {
                                      userController.pickUserImage();
                                      Get.back();
                                    });
                              },
                              child: Obx(
                                () => CircleAvatar(
                                  backgroundImage: FileImage(
                                    File(userController.imagePath.value),
                                  ),
                                  radius: height * 0.08,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Height003(height: height),
                  UserTextfield(
                    controller: _nameController,
                    validator: nameValidator,
                    obscureText: false,
                    label: 'Name',
                  ),
                  Height003(height: height),
                  UserTextfield(
                    controller: _emailController,
                    validator: emailValidator,
                    obscureText: false,
                    label: 'Email',
                  ),
                  Height003(height: height),
                  UserTextfield(
                    controller: _ageController,
                    obscureText: false,
                    validator: ageValidator,
                    label: 'Age',
                  ),
                  Height003(height: height),
                  UserTextfield(
                    controller: _phoneController,
                    obscureText: false,
                    validator: phoneValidator,
                    label: 'Phone',
                  ),
                  Height003(height: height),
                  LoginSignUpButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final name = _nameController.text.toString();
                          final phone = _phoneController.text.toString();
                          final email = _emailController.text.toString();
                          final age = _ageController.text.toString();
                          userController.createUser(name, phone, email, age,
                              userController.imagePath.value);
                          userController
                              .saveUser(userController.newUser!)
                              .then(Get.offAll(const GnavNavigation()));
                        }
                      },
                      label: 'Create User',
                      buttonTextColor: Pallete.white,
                      backgroundColor: Pallete.buttonColor),
                ],
              ),
            ),
          ),
        ));
  }
}
