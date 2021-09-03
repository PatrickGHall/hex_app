import 'package:flutter/material.dart';
import 'package:hex_app/display_text_model.dart';
import 'package:provider/provider.dart';
import 'package:hex_app/hex_string.dart';

class Keypad extends StatelessWidget {
  final decimalInputList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [9, 'CLR', 'HEX'],
  ];

  final hexInputList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [9, 10, 11],
    [12, 13, 14],
    [15, 'CLR', 'DEC']
  ];

  @override
  Widget build(BuildContext context) {
    final displayModel = context.watch<DisplayTextModel>();
    final inputList = displayModel.inputType == InputType.decimal
        ? decimalInputList
        : hexInputList;

    return Column(children: [
      for (final buttonRow in inputList)
        Expanded(
          child: Row(children: [
            for (final buttonText in buttonRow)
              Expanded(
                  child: FittedBox(
                child: ElevatedButton(
                    onPressed: () {
                      if (buttonText is int) {
                        displayModel.registerInput(buttonText.toHexString());
                      } else {
                        displayModel.clear();
                        if ('$buttonText' != 'CLR') {
                          displayModel.toggleInputType();
                        }
                      }
                    },
                    child: Text(buttonText is int
                        ? buttonText.toHexString()
                        : '$buttonText')),
              ))
          ]),
        )
    ]);
  }
}
