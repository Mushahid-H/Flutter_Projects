// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app_firebase/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FireStoreServices _fireStoreServices = FireStoreServices();

  final TextEditingController _noteController = TextEditingController();
  void showDialogBox(String? oldNote, String? docId) {
    if (oldNote != null) {
      _noteController.text = oldNote;
    }
    showDialog(
        context: context as BuildContext,
        builder: (context) {
          return AlertDialog(
              title: Text("Add Note"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    if (oldNote == null) {
                      _fireStoreServices.addNotes(_noteController.text);
                    } else {
                      _fireStoreServices.updateNotes(
                          _noteController.text, docId!);
                    }
                    Navigator.pop(context);
                    _noteController.clear();
                  },
                  child: Text("Add"),
                )
              ],
              content: TextField(
                controller: _noteController,
                decoration: InputDecoration(hintText: "Enter Note"),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBox(null, null);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Crud App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
      ),
      body: StreamBuilder(
        stream: _fireStoreServices.showData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = noteList[index];
                  Map<String, dynamic> noteInfo =
                      document.data() as Map<String, dynamic>;

                  String note = noteInfo["note"];
                  String docId = document.id;
                  return Card(
                    color: Colors.grey[300],
                    child: ListTile(
                      title: Text(note),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              showDialogBox(note, docId);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _fireStoreServices.deleteNotes(docId);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
