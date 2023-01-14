import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miro_board/main.dart';
import 'dart:ffi';



class CatScreen extends StatefulWidget {
  const CatScreen({super.key});
 @override
State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen>{
 var userInfo = {};
Future<void> getAPIcall() async {
  var url = Uri.parse('http://randomuser.me/api/');
  var response = await http.get(url);
  var data = json.decode(response.body);
   setState(() {
     userInfo = data('results');
   });
 }
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cat Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                
                decoration: BoxDecoration (
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage ('assets/im1.jpeg'),
                   opacity: 0.3,
                  fit: BoxFit.fitHeight,
                  ),
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                   'Name:',
                    style:  TextStyle(fontSize:40),
                    ),
                   Text(
                    '${userInfo[0]}',
                   ),
                  ],
                 )
              ),
              );
      
}

  
    }
  
   
    