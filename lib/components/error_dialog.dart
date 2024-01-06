import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  const ErrorDialog({super.key, required this.errorMessage });

@override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 35,
          ),
          SizedBox(width: 8),
          Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 16
        ),),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}