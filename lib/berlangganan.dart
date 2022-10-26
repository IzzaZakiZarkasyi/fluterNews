import 'package:flutter/material.dart';

class Berlangganan extends StatelessWidget {
  const Berlangganan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berlangganan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Berlangganan')],
        ),
      ),
    );
  }
}
