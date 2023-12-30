import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

import '../../../constants.dart';


class DateField extends StatefulWidget {
  const DateField({super.key});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
   DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
   Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onTap: () {
          _selectDate(context);
        },
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
              : "Select a date",
          prefixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}


const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
