import 'package:flutter/material.dart';

class CardService extends StatelessWidget {
  const CardService({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                children : [
                Expanded(
                  flex: 2,
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(10),
                      child: Image.asset(
                            'assets/images/massages/caruselTwo.jpg',
                            fit: BoxFit.cover,
                          ),
                    ),
                  ),
                 Expanded(
                  flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Massage!",
                             style: TextStyle(
                              fontWeight: FontWeight.bold, // Puedes ajustar el estilo según sea necesario
                              fontSize: 22, // Puedes ajustar el tamaño de fuente según sea necesario
                            ),),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.near_me_outlined,
                                size: 22),
                              Text('5300 + people')
                            ],
                          ),
                        ],
                      ), 
                    ),
                  ),
                ]
              );
  }
}