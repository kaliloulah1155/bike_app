import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GlobalKey<FormState> connectInsFormKey = GlobalKey<FormState>();
  late TextEditingController full_nameController,
      telController,
      emailController,
      passwordController;

  RxBool isSignupScreen = false.obs;
  RxBool isMale = false.obs;
  RxBool isRememberMe = false.obs;
  RxBool isPassword = true.obs;
  RxBool isPasswordConf = true.obs;

  bool loginScreen() {
    emptyField();
    return isSignupScreen.value = true;
  }

  bool signupScreen() {
    emptyField();
    return isSignupScreen.value = false;
  }

  bool genderMale() => isMale.value = true;

  bool genderFemale() => isMale.value = false;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    full_nameController = TextEditingController();
    telController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return true;
    }
    return false;
  }

  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
    return regExp.hasMatch(phoneNo);
  }

  void checkSignup(Map data) {
    if (validateEmail(data['email']) == true) {
      Get.snackbar("Error", "Votre email est invalide",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP);
    }

    if (isSignupScreen == false) //formulaire d'inscription
    {
      if (data['fullname'] != '' &&
          data['tel'] != '' &&
          data['email'] != '' &&
          data['mdp'] != '') {
        if (isPhoneNoValid(data['tel']) == false) {
          Get.snackbar("Error",
              "N°de téléphone invalide, veuillez rentrer les 10 chiffres svp",
              colorText: Colors.white,
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP);
        } else {
          print(data);
        }
      }
    } else {
      //formulaire de login

      if (data['email'] != '' && data['mdp'] != '') {

        var loginData = Map();
          loginData = {'email': data['email'], 'mdp': data['mdp']};

          Get.offAndToNamed('/boarding-screen');
          print(loginData);
      }
    }
  }

  void emptyField() {
    full_nameController.text = '';
    telController.text = '';
    emailController.text = '';
    passwordController.text = '';
  }

  @override
  void onClose() {
    emailController.dispose();
    full_nameController.dispose();
    telController.dispose();
    passwordController.dispose();
  }
//void increment() => count.value++;
}
