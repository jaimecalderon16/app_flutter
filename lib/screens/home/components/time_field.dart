import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

import '../../../constants.dart';

class TimeField extends StatefulWidget {
  const TimeField({Key? key}) : super(key: key);

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onTap: () {
          _selectTime(context);
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
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
