import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tut68/pages/detail_page.dart';

import '../models/my_model.dart';
import 'edit_page.dart';
import 'up_date_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore myCloud = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Home Page'),
        leading: const Text(''),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const EditPage()),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'LogOut this user',
                middleText: 'Confirm ? NO "click outside"',
                confirm: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.back(closeOverlays: true);
                    },
                    child: const Text('Yes')),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: myCloud.collection('myData').orderBy('year').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MyModel myItem = MyModel.fromJson(snapshot.data!.docs[index]);
                return Column(
                  children: [
                    const SizedBox(height: 3),
                    ListTile(
                      title: Text(myItem.name),
                      subtitle: Text(myItem.year),
                      tileColor: Colors.lightBlue,
                      onTap: () => Get.to(() => DetailPage(myItem: myItem)),
                      leading: IconButton(
                        onPressed: () =>
                            Get.to(() => UpDatePage(snapshot: snapshot, index: index)),
                        icon: const Icon(Icons.edit),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Delete Item to Cloud',
                            middleText: 'Confirm ? NO "click outside"',
                            confirm: ElevatedButton(
                                onPressed: () async {
                                  final myId = snapshot.data!.docs[index].id;
                                  await myCloud.collection('myData').doc(myId).delete();
                                  Get.back();
                                },
                                child: const Text('Yes')),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
