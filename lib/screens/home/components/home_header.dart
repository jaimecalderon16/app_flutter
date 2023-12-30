import 'package:flutter/material.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
              child: Text(
                'Hola Jaime',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18.0,  // Tamaño de fuente
                  fontWeight: FontWeight.bold,  // Peso de la fuente (por ejemplo, bold)
                  letterSpacing: 1.5,  // Espaciado entre caracteres
                  // Otros estilos según tus necesidades
                ),
                textAlign: TextAlign.center,  // Centrar el texto
              ),
          ),
          const Expanded( child: Icon(Icons.ac_unit_sharp)),
          const SizedBox(width: 16),
          
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
