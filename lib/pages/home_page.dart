import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tut68/providers/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider provider = Get.put(Provider());
    void addItem() {
      provider.lista.add('Paolo');
    }

    void logOut() {
      FirebaseAuth.instance.signOut();
      Get.back();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: const Text(''),
        actions: [
          IconButton(onPressed: () => addItem(), icon: const Icon(Icons.add)),
          IconButton(onPressed: () => logOut(), icon: const Icon(Icons.logout)),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: provider.lista.length,
          itemBuilder: (context, index) {
            return Text(provider.lista[index]);
          },
        );
      }),
    );
  }
}
