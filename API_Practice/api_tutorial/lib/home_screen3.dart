import 'dart:convert';

import 'package:api_tutorial/DartModels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage3 extends StatelessWidget {
  HomePage3({super.key});

  List<usersModel> users = [];

  Future<List<usersModel>> getApiData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        users.add(usersModel.fromJson(i as Map<String, dynamic>));
      }
      return users;
    } else {
      return users;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Complex JSON structure API'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getApiData(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ReusableRow(
                                        title: 'Name: ',
                                        value: users[index].name.toString()),
                                    ReusableRow(
                                        title: 'Username: ',
                                        value:
                                            users[index].username.toString()),
                                    ReusableRow(
                                        title: 'Email: ',
                                        value: users[index].email.toString()),
                                    ReusableRow(
                                        title: 'Phone: ',
                                        value: users[index].phone.toString()),
                                    ReusableRow(
                                        title: 'Address: ',
                                        value: users[index]
                                            .address!
                                            .city
                                            .toString()),
                                    ReusableRow(
                                        title: 'Latitude and Longitude: ',
                                        value: users[index]
                                                .address!
                                                .geo!
                                                .lat
                                                .toString() +
                                            " " +
                                            users[index]
                                                .address!
                                                .geo!
                                                .lng
                                                .toString()),
                                    ReusableRow(
                                        title: 'Company: ',
                                        value: users[index]
                                            .company!
                                            .name
                                            .toString()),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  })))
        ],
      ),
    );
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
