// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zerobudget/views/contas_form.dart';
import 'package:zerobudget/views/envelope_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseFirestore firestore = FirebaseFirestore.instance;

  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => AppWidget(),
        '/contas_form': (context) => ContasForm(),
        '/envelope_list': (context) => EnvelopeList(),
      },
    ),
  );
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Budget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Contas
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contas_form');
                    },
                    child: Text("Contas")),
              ),
              //Envelopes
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/envelope_list');
                    },
                    child: Text("Envelopes")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
