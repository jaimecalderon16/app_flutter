import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/card_service.dart';
import 'package:shop_app/screens/home/components/location_field.dart';
import 'package:shop_app/screens/home/components/date_field.dart';
import 'package:shop_app/screens/home/components/time_field.dart';
import 'package:shop_app/screens/home/components/numeric_filed_buttoms.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static String routeName = "/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFFF7C5CC),
        centerTitle: true,
        title: const Text("Secure Your Spot!", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
      ),
      body: const SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16),
          child:  Column(
            children : [
              CardService(),
              SizedBox(height: 10), 
              LocationField(),
              SizedBox(height: 10),
              Row(
                children: [
                   Expanded(
                    flex: 3,
                    child: DateField()
                   ),
                  SizedBox(width: 10),
                  Expanded(
                  flex: 2,
                    child:TimeField()
                  ), 
                ],
              ), 
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text('Select the number of visitors '),
                        Text('Person')
                      ],
                    )),
                  Expanded(
                    flex: 2,
                    child: NumericFieldButton()),
                ],
              ),
            ]
            
          ),
        ),
      ),
    );
  }
}
