import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyButtonSave extends StatelessWidget {
  const MyButtonSave({
    super.key,
    required this.addItem1,
    required this.addItem2,
    required this.click,
  });

  final TextEditingController addItem1;
  final TextEditingController addItem2;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            if (addItem1.text != '' && addItem2.text != '') {
              click(addItem1.text, addItem2.text);
              Get.back();
            }
          },
          child: const Text('Save', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class MyButtonUpDate extends StatelessWidget {
  const MyButtonUpDate({
    super.key,
    required this.addItem1,
    required this.addItem2,
    required this.click,
    required this.snapshot,
    required this.index,
  });

  final TextEditingController addItem1;
  final TextEditingController addItem2;
  final Function click;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            if (addItem1.text != '' && addItem2.text != '') {
              click(snapshot, index);
              Get.back();
            }
          },
          child: const Text('Save', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController controller;
  const MyTextField({
    super.key,
    required this.context,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        autofocus: true,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
