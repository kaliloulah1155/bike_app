import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accueil_controller.dart';

class AccueilView extends GetView<AccueilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccueilView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AccueilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
