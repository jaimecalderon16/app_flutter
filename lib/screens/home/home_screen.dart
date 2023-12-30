import 'dart:ui';

import 'package:flutter/material.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/carrusel.dart';
import 'components/popular_product.dart';
import 'components/icon_btn_with_counter.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const List<String> imagesCarrusel = [
      'assets/images/massages/carruselOne.png',
      'assets/images/massages/caruselThree.webp',
      'assets/images/massages/caruselTwo.jpg',
    ];
    return Scaffold(
      appBar: AppBar(title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hola Jaime',
            style: TextStyle(
            color: Colors.black54,
            fontSize: 22,  // Tamaño de fuente
            fontWeight: FontWeight.bold,  // Peso de la fuente (por ejemplo, bold)
            fontStyle: FontStyle.italic,  // Estilo de la fuente (por ejemplo, italic)
            letterSpacing: 1.5,  // Espaciado entre caracteres
            // Otros estilos según tus necesidades
          ),
          textAlign: TextAlign.center,),
          const SizedBox(width: 13),
          Image.asset(
            'assets/images/happy_emogi.png',
            width: 30,
            fit: BoxFit.cover,
            )
        ]),
        actions: [
          Padding(
            padding:  const EdgeInsets.only(right: 5),
            child: IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),)
        
      ],),
      drawer: const Drawer(
      backgroundColor: Colors.black,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Carousel(images: imagesCarrusel),
              Categories(),
              SpecialOffers(),
              // SizedBox(height: 20),
              // PopularProducts(),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
