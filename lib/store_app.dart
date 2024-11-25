
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(

      ),
      home: const Scaffold(
        body: Column(
          children: [
            Text('hello world'),
            Gap(5)
          ],
        ),
      ),
    );
  }
}
