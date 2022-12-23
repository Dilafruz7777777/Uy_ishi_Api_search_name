import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:namesearch/models/name.dart';
import 'package:namesearch/pages/Add_name_Page.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher_string.dart';

import '../Repository/GetInformationPage.dart';


class HomePage extends StatefulWidget {
  final String searchName;

  const HomePage({Key? key, this.searchName = "james"}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetInformationRepository api = GetInformationRepository();
  dynamic nameData;
  bool isLoading = true;

  Future<void> getInformation() async {
    isLoading = true;
    setState(() {});
    dynamic data = await api.getInformation(name: widget.searchName);
    nameData= NameM.fromJson(data);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.withOpacity(0.8),
        centerTitle: true,
        title: Text(" ${widget.searchName}"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
            child: Container(
        height: 150,
        width: 150,
        color: Colors.greenAccent.withOpacity(0.2),
        child: Column(
            children: [
              SizedBox(height: 40,),
              Center(child: Text(nameData?.count.toString() ?? '')),
              SizedBox(height: 20,),
              Center(child: Text(nameData?.gender ?? '')),
            ],
        ),
      ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddName()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}