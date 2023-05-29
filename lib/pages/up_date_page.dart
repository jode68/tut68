import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/my_model.dart';
import '../widgets/my_widget.dart';

class UpDatePage extends StatelessWidget {
  const UpDatePage({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore myCloud = FirebaseFirestore.instance;
    TextEditingController addItem1 = TextEditingController();
    TextEditingController addItem2 = TextEditingController();

    addItem1.text = MyModel.fromJson(snapshot.data!.docs[index]).name;
    addItem2.text = MyModel.fromJson(snapshot.data!.docs[index]).year;

    // update item to cloud
    void editItem(snapshot, index) async {
      final myId = snapshot.data!.docs[index].id;
      myCloud
          .collection('myData')
          .doc(myId)
          .update(MyModel(name: addItem1.text, year: addItem2.text).toJson());
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
            MyButtonUpDate(
              addItem1: addItem1,
              addItem2: addItem2,
              click: editItem,
              snapshot: snapshot,
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
