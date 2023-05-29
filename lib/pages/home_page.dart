import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/my_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore myCloud = FirebaseFirestore.instance;

    void logOut() {
      FirebaseAuth.instance.signOut();
      Get.back();
    }

    void addItem(name) async {
      await myCloud.collection('myData').add(MyModel(name: name).toJson());
    }

    void editItem(snapshot, index) async {
      final myId = snapshot.data!.docs[index].id;
      myCloud.collection('myData').doc(myId).update(MyModel(name: 'Simone').toJson());
    }

    void deleteItem(snapshot, index) {
      final myId = snapshot.data!.docs[index].id;
      myCloud.collection('myData').doc(myId).delete();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: const Text(''),
        actions: [
          IconButton(onPressed: () => addItem('Paolo'), icon: const Icon(Icons.add)),
          IconButton(onPressed: () => logOut(), icon: const Icon(Icons.logout)),
        ],
      ),
      body: StreamBuilder(
        stream: myCloud.collection('myData').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MyModel myItem = MyModel.fromJson(snapshot.data!.docs[index]);
                return ListTile(
                  title: Text(myItem.name),
                  leading: IconButton(
                    onPressed: () => editItem(snapshot, index),
                    icon: const Icon(Icons.edit),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteItem(snapshot, index),
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
