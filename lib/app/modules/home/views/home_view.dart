import 'dart:ui';

import 'package:bike_app/app/data/palette.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_view_pt.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    //formulaire d'inscription
    void checkSignupParams(String fullname,String tel,String email,String mdp,String gender){
        if(controller.isMale==true){
          gender='M';
        }else{
          gender='F';
        }
      controller.checkSignup({
        'fullname':fullname,
        'tel':tel,
        'email':email,
        'mdp':mdp,
        'gender':gender
      });
    }
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: controller.connectInsFormKey,
          child: Container(
            height: 650,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 300.h,
                    child: Container(
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 90, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Bienvenu sur ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                  children: [
                                    TextSpan(
                                        text: "XTreme",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow[700]))
                                  ]),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Veuillez-vous connecter',
                              style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Obx(
                    () => AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        //height: controller.isSignupScreen == false ? 440 : 330,
                        height: controller.isSignupScreen == false ? 440 : 330,
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width - 40,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: controller.loginScreen,
                                      child: Text(
                                        "CONNEXION",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: controller.isSignupScreen ==
                                                    true
                                                ? Palette.activeColor
                                                : Palette.textColor1),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: controller.signupScreen,
                                      child: Text(
                                        "INSCRIPTION",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: controller.isSignupScreen ==
                                                    true
                                                ? Palette.textColor1
                                                : Palette.activeColor),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  controller.isSignupScreen == false
                                      ? buildTextField(
                                          Icons.perm_identity,
                                          "Nom complet",
                                          false,
                                          false,
                                          controller.full_nameController)
                                      : Text(''),
                                  controller.isSignupScreen == false
                                      ? buildTextField(
                                          Icons.call,
                                          "Téléphone",
                                          false,
                                          false,
                                          controller.telController)
                                      : Text(''),
                                  buildTextField(Icons.email, "E-mail", false,
                                      true, controller.emailController),
                                  buildTextField(
                                      Icons.lock,
                                      "Mot de passe",
                                      true,
                                      false,
                                      controller.passwordController),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: controller.isSignupScreen == false
                                        ? Row(
                                            children: [
                                              SizedBox(width: 30),
                                              GestureDetector(
                                                onTap: controller.genderMale,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                      .isMale ==
                                                                  true
                                                              ? Colors.green
                                                              : Palette
                                                                  .textColor1,
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Palette
                                                                  .textColor1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Icon(
                                                        Icons.perm_identity,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Homme",
                                                      style: TextStyle(
                                                          color: Palette
                                                              .iconColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              GestureDetector(
                                                onTap: controller.genderFemale,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                      .isMale ==
                                                                  true
                                                              ? Palette
                                                                  .textColor1
                                                              : Colors.green,
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Palette
                                                                  .textColor1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Icon(
                                                        Icons.pregnant_woman,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Femme",
                                                      style: TextStyle(
                                                          color: Palette
                                                              .iconColor),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  child: Text(
                                                    'Mot de passe oublié ?',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                onTap: () {
                                                  Get.defaultDialog(
                                                      title:
                                                          "Mot de passe oublié",
                                                      middleText: "",
                                                      content: buildTextField(
                                                          Icons.email,
                                                          "E-mail",
                                                          false,
                                                          true,
                                                          controller
                                                              .emailController),
                                                      textConfirm: "Valider",
                                                      confirmTextColor:
                                                          Colors.white,
                                                      buttonColor: Colors.green,
                                                      onConfirm: () {
                                                        print('mot de passe oublié');
                                                      },
                                                      textCancel: "Annuler",
                                                      cancelTextColor:
                                                          Colors.green,
                                                      barrierDismissible:
                                                          false);
                                                },
                                              ),
                                            ],
                                          ),
                                  ),
                                  SizedBox(
                                    height: controller.isSignupScreen == false
                                        ? 15
                                        : 5,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.greenAccent,
                                                Colors.green
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              //Get.offAndToNamed('/boarding-screen');
                                               checkSignupParams(
                                                   controller.full_nameController.text,
                                                   controller.telController.text,
                                                   controller.emailController.text,
                                                   controller.passwordController.text,
                                                   'M'
                                               );
                                             // Get.toNamed('/boarding-screen');
                                            },
                                            child: Text(
                                              'Valider',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController ctrl) {
    final c = Get.find<HomeController>();
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child:
            ////Input standard
            !isPassword
                ? TextFormField(
                    keyboardType: isEmail
                        ? TextInputType.emailAddress
                        : TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          icon,
                          color: Palette.iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        contentPadding: EdgeInsets.all(10),
                        hintText: hintText,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.textColor1,
                        )),
                    controller: ctrl,

                  )
                ////Input Mot se passe visibile /invisible
                : TextFormField(
                    obscureText: c.isPassword.value,
                    keyboardType: isEmail
                        ? TextInputType.emailAddress
                        : TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          icon,
                          color: Palette.iconColor,
                        ),
                        suffixIcon: IconButton(
                          icon: c.isPassword.value
                              ? Icon(
                                  Icons.visibility_off,
                                )
                              : Icon(
                                  Icons.visibility,
                                ),
                          onPressed: () {
                            c.isPassword.value = !c.isPassword.value;
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        contentPadding: EdgeInsets.all(10),
                        hintText: hintText,
                        hintStyle:
                            TextStyle(fontSize: 14, color: Palette.textColor1)),
                    controller: ctrl,
                  ));
  }
}


