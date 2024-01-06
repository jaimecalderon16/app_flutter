import 'package:flutter/material.dart';
import 'package:shop_app/components/map.dart';

class MapScreen extends StatefulWidget {
  static String routeName = '/map_screen';
  const MapScreen({super.key});


  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
  final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    double? latitud = arguments?['latitud'];
    double? longitud = arguments?['longitud'];

    return Scaffold(
      body: Stack(
  children: [
         MapGoogle(latitud: latitud, longitud: longitud,),
         Positioned(
          top: 40.0,
          left: 20.0,
          child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                iconSize: 35,
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const  BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Calle 67 20-19', 
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),),
                const Text(
                  'Calle 67 20-19, barrios Unidos, Bogota',
                  style: TextStyle(
                    fontSize: 17
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Acciones al presionar el botón de confirmar
                  },
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    );
    
  }
}