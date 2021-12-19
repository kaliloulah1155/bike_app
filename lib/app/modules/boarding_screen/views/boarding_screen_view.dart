import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

import '../controllers/boarding_screen_controller.dart';

class BoardingScreenView extends GetView<BoardingScreenController> {
  @override
  Widget build(BuildContext context) {
    PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
      imagePadding: EdgeInsets.all(24),
    );

    return Scaffold(
      body:  SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: 'On fait du vélo avec Xtreme',
                body: "Si vous souhaitez vous déplacer en ville rapidement, C'est plus de 150 vélos partagés .",
                image: buildImage('assets/ebook.png'),
                decoration: getPageDecoration(),
                footer: RaisedButton(
                  child: Text("C'est parti !!!"),
                  onPressed: () {
                     Get.toNamed('/accueil');
                  },
                  color: Colors.greenAccent[100],
                )),
            PageViewModel(
              title: "Carte avec disponibilité en temps réel",
              body: "l'application vous indiquera la station la plus proche pour prendre ou rendre un vélo. Trajets illimités, 24 heures par jour, 7 jours par semaine",
              image: buildImage('assets/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Vous le signalez, Xtreme assure le suivi !",
              body: "Un défaut sur votre vélo ? pas de confirmation après avoir remis votre vélo en place ? signalez-le immédiatement via l'application.",
              image: buildImage('assets/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Avez-vous un abonnement annuel?",
              body: "Connectez-vous et découvrez votre zone d'utilisation ! pas encore accès à un vélo ? choisissez votre formule",
              image: buildImage('assets/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text(
            'Commencer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onDone: () {

            Get.toNamed('/accueil');
          },
          showNextButton: true,
          showSkipButton: true,
          skip: Text('Sauter'),
          next: Icon(
            Icons.arrow_forward,
          ),
          dotsDecorator: DotsDecorator(
              activeColor: Colors.green
          ),
          onChange: (index)=>print('Page $index selected'),
        ),
      ),
    );
  }
}



class buildImage extends StatelessWidget {
  String path;
  buildImage(this.path);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        path,
        width: 350,
      ),
    );
  }
}

