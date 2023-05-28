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

    void addItem(name) async {
      await myCloud.collection('myData').add(MyModel(name: name).toJson());
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
                final myId = snapshot.data!.docs[index].id;
                MyModel myItem = MyModel.fromJson(snapshot.data!.docs[index]);
                return ListTile(
                  title: Text(myItem.name),
                  leading: IconButton(
                    onPressed: () {
                      myCloud
                          .collection('myData')
                          .doc(myId)
                          .update(MyModel(name: 'Ciao').toJson());
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      myCloud.collection('myData').doc(myId).delete();
                    },
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
