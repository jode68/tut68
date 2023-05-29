import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/my_model.dart';
import '../widgets/my_widget.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore myCloud = FirebaseFirestore.instance;
    TextEditingController addItem1 = TextEditingController();
    TextEditingController addItem2 = TextEditingController();

    //add item to cloud
    void addItem(name, year) async {
      await myCloud.collection('myData').add(MyModel(name: name, year: year).toJson());
    }

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Edit Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(context: context, controller: addItem1),
            MyTextField(context: context, controller: addItem2),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Divider(
                color: Colors.black,
                thickness: 2,
              ),
            ),
            MyButtonSave(
              addItem1: addItem1,
              addItem2: addItem2,
              click: addItem,
            ),
          ],
        ),
      ),
    );
  }
}
