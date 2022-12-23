import 'package:flutter/material.dart';
import 'package:namesearch/pages/HomePage.dart';
class AddName extends StatefulWidget {
  const AddName({Key? key}) : super(key: key);

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(labelText: "Name"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(
                  searchName: textEditingController.text,
                ),
              ),
                  (route) => false);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}