import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/new_sce/item_page.dart';
import 'package:http/http.dart' as http;

class Pizzapage2 extends StatefulWidget {
  const Pizzapage2({Key? key}) : super(key: key);

  @override
  State<Pizzapage2> createState() => _Pizzapage2State();
}

String baseUrl = 'https://628dd36fa339dfef87a10005.mockapi.io';

class _Pizzapage2State extends State<Pizzapage2> {
  bool _isLoading = false;
    String? name = '';
  List<User> users = [];
  User? user;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  List image = [
    'https://www.kindpng.com/picc/m/22-221463_margherita-pizza-hd-png-transparent-png.png',
    'https://png.pngtree.com/png-clipart/20210808/original/pngtree-big-pizza-png-png-image_6611417.png',
    'http://pizzaparadise.in/wp-content/uploads/2019/10/paneer-onion-pizza-mania.png',
    'https://toppng.com/uploads/preview/pizza-png-11553999023us8qgrzbjg.png',
    'https://img.favpng.com/11/21/21/sicilian-pizza-italian-cuisine-kebab-new-york-style-pizza-png-favpng-8stihPEGJardJYsWLCuRSD4aP.jpg',
    'https://simg.nicepng.com/png/small/1-15614_cheese-pizza-png-caulipower-pizza-three-cheese-11-6.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTqG-GAHOFjy0mnp7QqyTUb_PcgbjIInQOxeqX0GaViwMk8jgDInJz3j-FjQFZU2QS1d0&usqp=CAU',
  ];
  List pazzi_name = [
    "Piazza Paneer",
    "Olive Tomato",
    "Paneer Onione",
    "Tomato Pizza",
    "Onions Tomato ",
    "Cheese Pizza",
    "Extra Cheese"
  ];
  List price = [
    "Rs.299",
    "Rs.399",
    "Rs.199",
    "Rs.149",
    "Ra.249",
    "Rs.99",
    "Rs.199"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // _isLoading
              // ? const Center(child: CircularProgressIndicator.adaptive())
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),

                  // scrollDirection: Axis.horizontal,
                  itemCount: pazzi_name.length,
                  itemBuilder: (contex, index) {
                    return _itemdemo(
                      image: image[index],
                      name: pazzi_name[index],
                      price: price[index],
                    );
                  }),
            ],
          ),
        ));
  }

  Widget _itemdemo({String? image, String? name, String? price}) {
    return Row(
      children: [
        Card(
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(image!), fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  name!,
                  style: const TextStyle(
                      color: Color.fromRGBO(196, 81, 106, 1), fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "This is a Deliciase Pizza ,eating now or every week.",
                  style: TextStyle(color: Color.fromARGB(255, 239, 228, 224)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      price!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        
                        var image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ItemsPage(id: user?.id,
                                    
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(170, 113, 93, 1),
                          onPrimary: const Color(0xFFF2F3EE)),
                      child: const Text("Add +"))
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void getUser() async {
    setState(() => _isLoading = true);
    http.Response res = await http.get(Uri.parse('$baseUrl/user'));
    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);
      decoded.forEach((v) {
        setState(() {
          users.add(User(
            id: v['id'],
            
            // name: v['name'],
             image: v['image'],
            // createdAt: v['createdAt'],
          ));
        });
      });
      setState(() => _isLoading = false);
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
