import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pageinscription/accueil.dart';
import 'package:pageinscription/form.dart';
import 'package:http/http.dart' as http;

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  List ta = [];
  void getConstact() async {
    var url = Uri.parse(
        'https://utilisateur-7d6c7-default-rtdb.firebaseio.com/constact.json');
    var constact = await http.get(url);
    setState(() {
      ta = (jsonDecode(constact.body) as Map).values.toList();
    });
    @override
    void initState() {
      super.initState();
      getConstact();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 1,
        leading: Container(
          padding: EdgeInsets.all(9),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(ta.length.toString()),
          ),
        ),
        centerTitle: true,
        title: Text('Constact Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Fo.routName);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: width * 0.8,
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                      hintText: "Search",
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
         Container(
           //color: Colors.yellow,
           height: 200,
           child: ListView.builder(
            itemCount: ta.length,
            itemBuilder: (context, i) => Column(children: [
              ListTile(
                leading: CircleAvatar(),
                subtitle: Text(ta[i]['nom'],style: TextStyle(color: Colors.black),),
                      ),
                    ])),
         )
         
        ],
      ),
    );
  }
}
