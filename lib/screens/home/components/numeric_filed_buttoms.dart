import 'package:flutter/material.dart';

class NumericFieldButton extends StatefulWidget {
  final int quantity;
  final int sumValue;
  final int maxvalue;
  const NumericFieldButton(
      {Key? key,
      required this.quantity,
      required this.sumValue,
      required this.maxvalue})
      : super(key: key);

  @override
  State<NumericFieldButton> createState() => _NumericFieldButtonState();
}

class _NumericFieldButtonState extends State<NumericFieldButton> {
  late int quantity; // Valor inicial
  late int sumValue; // Valor inicial
  late int maxvalue; // Valor inicial

  @override
  void initState() {
    super.initState();
    // Inicializa la variable local con el valor del widget
    quantity = widget.quantity;
    sumValue = widget.sumValue;
    maxvalue = widget.maxvalue;
  }

  @override
  Widget build(BuildContext context) {
    final int initQuantity = widget.quantity;
    return FormField<int>(
      builder: (FormFieldState<int> state) {
        return Row(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: 30, // Ajusta el ancho del contenedor según tus necesidades
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius:
                    BorderRadius.circular(5.0), // Ajusta según sea necesario
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantity > initQuantity) {
                      quantity = quantity - sumValue;
                      state.didChange(quantity);
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: Text(
                quantity.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 30, // Ajusta el ancho del contenedor según tus necesidades
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius:
                    BorderRadius.circular(5.0), // Ajusta según sea necesario
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (quantity < maxvalue) {
                        quantity = quantity + sumValue;
                        state.didChange(quantity);
                      }
                    });
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
