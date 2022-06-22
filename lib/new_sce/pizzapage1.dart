import 'package:flutter/material.dart';
import 'package:flutter_application_2/new_sce/pizzapage2.dart';

class Pizzapage1 extends StatefulWidget {
  const Pizzapage1({Key? key}) : super(key: key);

  @override
  State<Pizzapage1> createState() => _Pizzapage1State();
}

class _Pizzapage1State extends State<Pizzapage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/set-hand-drawn-vector-meals-pizza-hot-dog-burger-milkshake-hot-chocolate-fast-food-cafe-menu-illustration-fast-food-cafe-menu-146801887.jpg'),
              fit: BoxFit.cover,
              opacity: 130,
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600, left: 120),
            child: MaterialButton(
              color: const Color.fromRGBO(206, 183, 183, 1)
              ,
              onPressed: () {
                setState(() {
                  
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const  Pizzapage2())));
                });
              },
              shape: const RoundedRectangleBorder(

                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Text(
                "Buy now",
                style: TextStyle(color: Color.fromARGB(255, 134, 82, 3), fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
