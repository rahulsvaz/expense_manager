import 'dart:io';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/viewModel/userController/user_controller.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/createAccountPage/validators/validators.dart';
import 'package:expense_manager/view/createAccountPage/widgets/text_form_field.dart';
import 'package:expense_manager/view/homeScreen/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final userBox = Hive.box<User>('UserBox');

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
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final userController = Get.put(UserController());
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
                  child: Obx(
                    () => Center(
                      child: userController.imagePath.isEmpty
                          ? CircleAvatar(
                              radius: height * 0.07,
                              backgroundImage: const AssetImage(
                                  'assets/images/user_logo.jpg'),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                File(userController.imagePath.value),
                              ),
                              radius: height * 0.08,
                            ),
                    ),
                  )),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.28,
                child: Center(
                  child: Text(
                    'Please Enter Your Details!',
                    style: GoogleFonts.openSans(
                      fontSize: width * .06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.35,
                child: Center(
                  child: UserTextfield(
                      label: 'Name',
                      prefix: const Icon(
                        Icons.abc,
                        color: Pallete.grey,
                      ),
                      controller: _nameController,
                      obscureText: false,
                      validator: nameValidator),
                ),
              ),
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   top: height * 0.45,
              //   child: Center(
              //     child: UserTextfield(
              //         prefix: const Icon(
              //           Icons.email,
              //           color: Pallete.grey,
              //         ),
              //         label: 'Email',
              //         controller: _emailController,
              //         obscureText: false,
              //         validator: emailValidator),
              //   ),
              // ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.45,
                child: Center(
                  child: UserTextfield(
                      prefix: const  Icon(
                        Icons.numbers_rounded,
                        color: Pallete.grey,
                      ),
                      label: 'Age',
                      controller: _ageController,
                      obscureText: false,
                      validator: ageValidator),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.55,
                child: Center(
                  child: UserTextfield(
                      prefix: const Icon(
                        Icons.phone,
                        color: Pallete.grey,
                      ),
                      label: 'Phone',
                      controller: _phoneController,
                      obscureText: false,
                      validator: phoneValidator),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.65,
                child: Center(
                    child: LoginSignUpButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final name = _nameController.text.toString();
                            final phone = _phoneController.text.toString();
                            final email = _emailController.text.toString();
                            final age = _ageController.text.toString();

                            userController.createNewUser(name, phone, age,
                                email, userController.imagePath.value);
                          }
                        },
                        label: 'Save',
                        buttonTextColor: Pallete.white,
                        backgroundColor: Pallete.purple)),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.75,
                child: Obx(
                  () => Flexible(
                    child: TextButton(
                  
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
                                child: const Text('Gallery')),
                            onConfirm: () {});
                      },
                      child: userController.imagePath.isEmpty
                          ? const Text(
                              'Add Profile Picture ?',
                              style:
                                  TextStyle(color: Pallete.purple, fontSize: 14),
                            )
                          : const Text(
                              'Change Profile Picture?',
                              style:
                                  TextStyle(color: Pallete.purple, fontSize: 14),
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
