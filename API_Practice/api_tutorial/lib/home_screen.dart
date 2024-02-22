import 'dart:convert';

import 'package:api_tutorial/DartModels/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<postsModel> postslist = [];

  Future<List<postsModel>> getposts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postslist.clear();
      for (Map i in data) {
        postslist.add(postsModel.fromJson(i as Map<String, dynamic>));
      }
      return postslist;
    } else {
      return postslist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('API Tutorial'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getposts(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: postslist.length,
                          itemBuilder: (context, index) {
                            return Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Title:',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      ),
                                      Text(postslist[index].title.toString()),
                                      const Text(
                                        '\Description:',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      ),
                                      Text(postslist[index].body.toString()),
                                    ],
                                  ),
                                ));
                          });
                    }
                  })),
            )
          ],
        ));
  }
}
