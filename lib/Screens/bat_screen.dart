import 'package:flutter/material.dart';
import 'package:miro_board/main.dart';
import 'dart:ffi';

class BatScreen extends StatefulWidget {
  const BatScreen(
  this.id,
  this.name,
  this.fatherName,
  this.department,
  this.description,
  {super.key,}
  );

final int id;
final String name;
final String fatherName;
final String department;
final String description;
 
  @override

  State<BatScreen> createState() => _BatScreenState(
  id,
  name,
  fatherName,
  department,
  description,);
}

class _BatScreenState extends State<BatScreen>
{
  _BatScreenState(
  this.id,
  this.name,
  this.fatherName,
  this.department,
  this.description,);

final int id;
final String name;
final String fatherName;
final String department;
final String description;
  
Widget textWidget(String content) {
  return Text(
    content,
   style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),);
  
}
@override
  void initState()
  {
    super.initState();
    print('id = $id');
    print('name = $name');
    print('fatherName = $fatherName');
    print('department = $department');
    print('description = $description');
    
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$id'),
      ),
      
      body: Column(
        children: [
          Row(
            mainAxisAlignment: 
            MainAxisAlignment.spaceEvenly,
            children:[
              textWidget(name),
               textWidget(fatherName),
            ],
          ),

          const SizedBox(height: 50),
          Text(department,style: const TextStyle(
                fontSize: 20,
                color: Colors.black,),),


          const SizedBox(height: 50),
          Text(description,style: const TextStyle(
                fontSize: 20,
                color: Colors.black,),),
        ],
        ),


    );
  }
}