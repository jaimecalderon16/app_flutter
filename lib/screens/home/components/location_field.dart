import 'package:flutter/material.dart';
import 'package:shop_app/screens/maps/map_screen.dart';

import '../../../constants.dart';

class LocationField extends StatefulWidget {
  final List<String?> errors;

  const LocationField({super.key, required this.errors});

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  String? address;

  void addError({String? error}) {
    if (!widget.errors.contains(error)) {
      setState(() {
        widget.errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (widget.errors.contains(error)) {
      setState(() {
        widget.errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true, // Deshabilita la edición del texto
      enableInteractiveSelection: false,
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              onSaved: (newValue) => address = newValue,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kAddressNullError);
                                } else if (emailValidatorRegExp
                                    .hasMatch(value)) {
                                  removeError(error: kAddressNullError);
                                }
                                return;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kAddressNullError);
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kSecondaryColor.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                border: searchOutlineInputBorder,
                                focusedBorder: searchOutlineInputBorder,
                                enabledBorder: searchOutlineInputBorder,
                                hintText: "Enter your address",
                                prefixIcon: const Icon(Icons.location_on),
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                onTap: () => {
                                  Navigator.pushNamed(context, MapScreen.routeName,  arguments: {'latitud': 4.6587835, 'longitud': -74.1107824}),
                                },
                                child:
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black45),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Calle 67 #11-23',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      Text(
                                        'Bogota, Colombia',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  
                                )
                              ),
                                // Agrega más contenedores según sea necesario
                              ],
                            ),
                          ]),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.near_me),
                        label: const Text(
                          'use my current location',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () => Navigator.pushNamed(context, MapScreen.routeName),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: kSecondaryColor.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: searchOutlineInputBorder,
        focusedBorder: searchOutlineInputBorder,
        enabledBorder: searchOutlineInputBorder,
        hintText: "Enter your address",
        prefixIcon: const Icon(Icons.location_on),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
