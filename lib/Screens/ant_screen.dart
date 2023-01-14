import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miro_board/Screens/bat_screen.dart';
import 'package:http/http.dart'as http;



class AntScreen extends StatefulWidget {
  const AntScreen({super.key});

  @override
  State<AntScreen> createState() => _AntScreen();
}

class _AntScreen extends State<AntScreen> {
  Dio dio =Dio();
  int id = 1;
  List studentsInfo =  [];
  List products = [];

Future<void> readJson() async{
  final String response = await rootBundle.loadString('assests/data.json');
  final data = await json.decode(response);
  setState(() {
    studentsInfo = data["studentsInfo"];
  });
}
// Future<void> readJson() async {

//   final String response = await rootBundle.loadString('assets/data.json');
//   final data = await json.decode(response);
//   setState(() {
//     studentsInfo = data["studetsInfo"];
//   });
// }
 //API call for getting
 Future<void> getAPIcall() async {
  var url = Uri.parse('https://dummyjson.com/products');
  var response = await http.get(url);
  var data = await json.decode(response.body);
  setState(() {
    products = data['products'];
  });
  
 }

// Getting API call using Dio Lib
 Future<void> getAPIcallDio() async {
  var url = 'https://dummyjson.com/products';
  
  try {
    var response = await dio.get(url);
  // var data = await json.decode(response.body);
  setState(() {
    products = response.data['products'];
  });
  } catch (e) {
    print(e);
  }
  
 }
  @override
  void initState()
  {
    super.initState();
    // readJson();
    // getAPIcall();
    getAPIcallDio();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Alohomora',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),

    body: products.isEmpty
    ?const Center(child: CircularProgressIndicator(),)
    :ListView.builder(
      itemCount:products.length ,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector (

        //     //   onTap: () {
        //     //   Navigator.push(
        //     //   context, 
        //     //   MaterialPageRoute
        //     //   (
                
        //     //     builder: (context)=>  BatScreen(
        //     //       studentsInfo[index]['id'],   
        //     //       studentsInfo[index]['name'],
        //     //       studentsInfo[index]['fatherName'],
        //     //       studentsInfo[index]['dept'],
        //     //       studentsInfo[index]['description'],
        //     //     )
        //           // Data will pass seperately

        //         ),
        //         );
        //     },
              child: ListTile(
                leading:CircleAvatar(
                
                  backgroundColor:Colors.black ,
                  child:ClipOval(child:new SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child:CachedNetworkImage(
                      imageUrl:'${products[index]['thumbnail']}',
                      placeholder: ((context, url) => const CircularProgressIndicator()),
                      )
                    // Image.network(products[index]['thumbnail']), 
                    // thumbnail main URL pass hwa hay
                  ),
                  ),
                  
                  
                  ),
                  title:Text(
                    '${products[index]['title']}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          //       leading: Text('${products[index]['id']}'),
          //       title: Text('${products[index]['name']}'),
          //       subtitle: Text('${products[index]['dept']}'),
          //       trailing: const Icon(Icons.chevron_right),
          //     ),
          //   ),
          //   const Divider(
          //     thickness:2,
          //     color: Colors.black,
          //   ),

          //   const Divider(),
          
             
          // ],
          subtitle:Text(
                    '${products[index]['brand']}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
        ),
            ),
          ]);
      

      },
      
      
      ),
    );
  }
}
