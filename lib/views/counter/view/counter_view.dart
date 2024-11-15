import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(number.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // number = number + 1;
          // print(number);

          setState(() {
            number = number + 1;
          });
        },
        child: const Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
