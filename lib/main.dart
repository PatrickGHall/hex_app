import 'package:flutter/material.dart';
import 'package:hex_app/display_text_model.dart';
import 'package:hex_app/keypad.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DisplayTextModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  context.select<DisplayTextModel, String>(
                      (model) => model.topText),
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  context.select<DisplayTextModel, String>(
                      (model) => model.bottomText),
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Expanded(
                flex: 4,
                child: Keypad(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
