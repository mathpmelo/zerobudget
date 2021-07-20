import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EnvelopeList extends StatefulWidget {
  const EnvelopeList({Key? key}) : super(key: key);

  @override
  _EnvelopeListState createState() => _EnvelopeListState();
}

class _EnvelopeListState extends State<EnvelopeList> {
  //Firestore Instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var envelopes = Map<String, dynamic>();
  var envelopesArr = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Envelopes"),
      ),
      body: Material(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              retrieveEnvelope(),
              ElevatedButton(
                onPressed: () {
                  retrieveEnvelope();
                },
                child: Text("RETRIEVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  retrieveEnvelope() {
    var i = 0;
    firestore.collection("Contas").get().then((querySnapshot) {
      querySnapshot.docs.forEach(
        (result) => {envelopesArr.add(result.data())},
      );
    });
    envelopesArr.forEach((e) {
      i++;
      print("iteração =========== $i");
      print(e);
    });
    return Text(envelopesArr.length.toString());
  }

  novaFuncao() {}
}
