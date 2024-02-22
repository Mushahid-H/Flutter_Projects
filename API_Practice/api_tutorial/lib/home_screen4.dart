import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  var data;

  Future<void> getUserApi() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: FutureBuilder(
              future: getUserApi(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'Name: ',
                                  value: data[index]['name'].toString()),
                              ReusableRow(
                                  title: 'Username: ',
                                  value: data[index]['username'].toString()),
                              ReusableRow(
                                  title: 'email: ',
                                  value: data[index]['email'].toString()),
                              ReusableRow(
                                  title: 'Adress: ',
                                  value: data[index]['address']['city']
                                      .toString()),
                              ReusableRow(
                                  title: 'Latitude: ',
                                  value: data[index]['address']['geo']['lat']
                                      .toString()),
                            ],
                          ),
                        );
                      }));
                }
              })))
    ]);
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
