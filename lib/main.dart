import 'package:flutter/material.dart';

import 'package:flutter_application_2/new_sce/pizzapage1.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const  Pizzapage1(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
// runApp(MyApp());
// }

// class MyApp extends StatelessWidget {

// // This widget is the root
// // of your application.
// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'PageView',
// 	theme: ThemeData(
// 		primarySwatch: Colors.blue,
// 	),
// 	debugShowCheckedModeBanner: false,
// 	home: MyHomePage(),
// 	);
// }
// }

// class MyHomePage extends StatefulWidget {
// @override
// _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

// PageController controller=PageController();
// // ignore: prefer_final_fields
// List<Widget> _list=<Widget>[
// 	 Center(child: Pages(text: "Page 1",)),
// 	 Center(child: Pages(text: "Page 2",)),
// 	 Center(child: Pages(text: "Page 3",)),
// 	 Center(child: Pages(text: "Page 4",))
// ];
// int _curr=0;

// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	backgroundColor: Colors.grey,
// 	appBar:AppBar(
// 		title:const Text("GeeksforGeeks"),
// 		backgroundColor: Colors.green,
// 		actions: <Widget>[
// 		Padding(
// 			padding: const EdgeInsets.all(3.0),
// 			child: Text(
// 			"Page: "+(
// 				_curr+1).toString()+"/"+_list.length.toString(),textScaleFactor: 2,),
// 		)
// 		],),
// 	body: PageView(
// 		children:
// 		_list,
// 		scrollDirection: Axis.horizontal,
		
// 		// reverse: true,
// 		// physics: BouncingScrollPhysics(),
// 		controller: controller,
// 		onPageChanged: (num){
// 		setState(() {
// 			_curr=num;
// 		});
// 		},
// 	),
	
	
		
	
// 	);
// }
// }

// class Pages extends StatelessWidget {
// final text;
// Pages({this.text});
// @override
// Widget build(BuildContext context) {
// return Center(
// 	child: Column(
// 		mainAxisAlignment: MainAxisAlignment.center,
// 		children:<Widget>[
// 		Text(text,textAlign: TextAlign.center,style: TextStyle(
// 			fontSize: 30,fontWeight:FontWeight.bold),),	
// 		]
// 	),
// 	);
// }
// }
