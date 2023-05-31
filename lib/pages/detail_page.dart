import 'package:flutter/material.dart';

import '../models/my_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.myItem,
  });
  final MyModel myItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.yellow,
                child: Text('Name = ${myItem.name}', style: const TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.green,
                child: Text('Year = ${myItem.year}', style: const TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.green,
                child: Text('Prod = ${myItem.prod}', style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
