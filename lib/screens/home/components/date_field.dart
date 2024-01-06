import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

import '../../../constants.dart';


class DateField extends StatefulWidget {
  final List<String?> errors;

  const DateField({super.key, required this.errors});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
   DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
      DateTime now = DateTime.now();
      DateTime twoWeeksLater = now.add(const Duration(days: 14));

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: twoWeeksLater,
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
        if(selectedDate != null){
          removeError(error: kDateNullError);
        }
      }
  }

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
        onTap: () {
          _selectDate(context);
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kDateNullError);
          }
          return;
        },
        validator: (value) {
          if (selectedDate == null) {
            print('entro');
            addError(error: kDateNullError);
          }
          return null;
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
      );
  }
}


const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
