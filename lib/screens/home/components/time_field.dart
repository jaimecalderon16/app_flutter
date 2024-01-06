import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

import '../../../constants.dart';

class TimeField extends StatefulWidget {
  final List<String?> errors;

  const TimeField({super.key, required this.errors});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
   TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });

      if(selectedTime != null){
        removeError(error: kTimeNullError);
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
          _selectTime(context);
          
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kTimeNullError);
          }
          return;
        },
        validator: (value) {
          if (selectedTime == null) {
            addError(error: kTimeNullError);  
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
          hintText: selectedTime != null
              ? DateFormat.Hm().format(
                  DateTime(2022, 1, 1, selectedTime!.hour, selectedTime!.minute))
              : "Time",
          prefixIcon: const Icon(Icons.access_time),
        ),
      );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
