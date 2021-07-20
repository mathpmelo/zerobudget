import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContasForm extends StatefulWidget {
  const ContasForm({Key? key}) : super(key: key);

  @override
  _ContasFormState createState() => _ContasFormState();
}

class _ContasFormState extends State<ContasForm> {
  //Cria controller pro textfield
  final nameCtrl = TextEditingController();
  final valueCtrl = TextEditingController();

  //Firestore Instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Limpa ao descartar widget
  @override
  void dispose() {
    nameCtrl.dispose();
    valueCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                      labelText: "Nome", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: valueCtrl,
                  decoration: InputDecoration(
                      labelText: "Valor", border: OutlineInputBorder()),
                ),
              ),
              // Botão enviar
              ElevatedButton(
                  onPressed: () => writeAccount(context),
                  child: Text("Adicionar"))
            ],
          ),
        ),
      ),
    );
  }

  void writeAccount(BuildContext context) {
    var novaConta = Map<String, dynamic>();
    novaConta["nome"] = nameCtrl.text;
    novaConta["valor"] = valueCtrl.text;
    //print(novaConta);
    firestore.collection("Contas").add(novaConta).whenComplete(() {
      Navigator.of(context).pop();
    });
  }
}
