import 'package:flutter/material.dart';

class NumericFieldButton extends StatefulWidget {
  const NumericFieldButton({Key? key}) : super(key: key);

  @override
  State<NumericFieldButton> createState() => _NumericFieldButtonState();
}

class _NumericFieldButtonState extends State<NumericFieldButton> {
  int quantity = 0; // Valor inicial

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      builder: (FormFieldState<int> state) {
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (quantity > 0) {
                    quantity--;
                    state.didChange(quantity);
                  }
                });
              },
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                controller: TextEditingController(text: quantity.toString()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  quantity++;
                  state.didChange(quantity);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
