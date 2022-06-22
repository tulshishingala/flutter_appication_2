import 'package:flutter/material.dart';

class PageView1 extends StatefulWidget {
  const PageView1({Key? key}) : super(key: key);

  @override
  State<PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  final PageController _con = PageController();

  @override
  void initState() {
    _con.addListener(() {setState(() {
      var  curentIndex = _con.page;
    });});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List image = [
      'https://www.kindpng.com/picc/m/22-221463_margherita-pizza-hd-png-transparent-png.png',
      'https://png.pngtree.com/png-clipart/20210808/original/pngtree-big-pizza-png-png-image_6611417.png',
      'http://pizzaparadise.in/wp-content/uploads/2019/10/paneer-onion-pizza-mania.png',
      'https://toppng.com/uploads/preview/pizza-png-11553999023us8qgrzbjg.png',
      'https://img.favpng.com/11/21/21/sicilian-pizza-italian-cuisine-kebab-new-york-style-pizza-png-favpng-8stihPEGJardJYsWLCuRSD4aP.jpg',
      'https://simg.nicepng.com/png/small/1-15614_cheese-pizza-png-caulipower-pizza-three-cheese-11-6.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTqG-GAHOFjy0mnp7QqyTUb_PcgbjIInQOxeqX0GaViwMk8jgDInJz3j-FjQFZU2QS1d0&usqp=CAU',
    ];

    
    var curentIndex;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              controller: _con,
              children: image.map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:Image(image: NetworkImage(e),),
              )).toList()
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: image.map((e) => Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: curentIndex == image.indexOf(e)?
                  const Color(0xFFD2A623):
                  Color.fromARGB(31, 255, 255, 255),
                  shape: BoxShape.circle
                ),
              )).toList()
            ),
          ),
        ],
      ),
      
    );
  }

//   Widget _itemText({String? image}) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.brown,
//           image: DecorationImage(image: NetworkImage(image!))),
//     );
//   }
}
