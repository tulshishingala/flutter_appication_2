import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/new_sce/pizzapage2.dart';

class ItemsPage extends StatefulWidget {
  final String? id;
  final String? image;
  const ItemsPage({Key? key,required this.id, this.image}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text("${user?.name}"),
      Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${user?.image}')
          )
        ),
      )
      ]),
    );
  }

  void getUser() async {
    http.Response res =
        await http.get(Uri.parse('$baseUrl/users/${widget.id}'));

    print(widget.id);
    print(res.statusCode);
    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);
      setState(() {
        user = User(
          name: decoded['name'],
          
          image: decoded['avatar'],
          createdAt: decoded['createdAt'],
        );
      });
    }
  }
}

class User {
  final String? id;
  final String? name;
  final String? image;
  final String? createdAt;

  User({this.id, this.name, this.image, this.createdAt});
}
