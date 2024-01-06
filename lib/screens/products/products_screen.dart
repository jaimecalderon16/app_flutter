import 'package:flutter/material.dart';
import 'package:shop_app/components/error_dialog.dart';
import 'package:shop_app/screens/home/components/card_service.dart';
import 'package:shop_app/screens/home/components/location_field.dart';
import 'package:shop_app/screens/home/components/date_field.dart';
import 'package:shop_app/screens/home/components/time_field.dart';
import 'package:shop_app/screens/home/components/numeric_filed_buttoms.dart';
import 'package:shop_app/screens/screens_basics/waiting_screen.dart';
import '../../../helper/keyboard.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  static String routeName = "/products";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String?> errors = [];

  void _showErrorDialog(String errorMessage) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(errorMessage: errorMessage);
        },
      );
  }

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
      body: SafeArea(
        child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children : [
              const CardService(),
              const SizedBox(height: 10), 
              LocationField(errors: errors,),
              const SizedBox(height: 10),
              
              Image.asset(
                'assets/images/address.png',
                width: 115,
              ),

              const Text(
                'Enter your address in bogota',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                )),
              const SizedBox(height: 10),
              const Expanded(
              child: Text(
                'Better service, faster services and the most convenient prices',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                )),
              ),
 
              Row(
                children: [
                   Expanded(
                    flex: 3,
                    child:  DateField(errors: errors,)
                   ),
                  const SizedBox(width: 10),
                  Expanded(
                  flex: 2,
                    child: TimeField(errors: errors,)
                  ), 
                ],
              ), 
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select the number of visitors'),
                        Text('Person',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    )),
                  Expanded(
                    flex: 3,
                    child: NumericFieldButton(quantity: 1, sumValue: 1, maxvalue: 4,)),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Please select the time  '),
                        Text('Minutes',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    )),
                  Expanded(
                    flex: 3,
                    child: NumericFieldButton(quantity: 60 , sumValue: 30, maxvalue: 120,)),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                    onPressed: () {
                    if (_formKey.currentState!.validate() && !errors.isNotEmpty) {
                          _formKey.currentState!.save();
                          // if all are valid then go to success screen
                          KeyboardUtil.hideKeyboard(context);
                          Navigator.pushNamed(context, WaitingScreen.routeName);
                        }else{
                          _showErrorDialog(errors[0] ?? '');
                        }
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),),
                  ),
            ]
            
          ),
        ),
      ),
      )
    );
  }
}
