import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatelessWidget {
  HomePage2({super.key});

  List<Photos> photos = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      photos.clear();
      for (Map i in data) {
        Photos photo = Photos(title: i['title'], url: i['url']);
        photos.add(photo);
      }
      return photos;
    } else {
      return photos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('API Tutorial EX2'),
        ),
        body: Column(children: [
          Expanded(
              child: FutureBuilder(
                  future: getPhotos(),
                  builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].url.toString()),
                              ),
                              title:
                                  Text(snapshot.data![index].title.toString()));
                        },
                      );
                    }
                  }))
        ]));
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}
