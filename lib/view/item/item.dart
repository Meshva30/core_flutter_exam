
import 'package:flutter/material.dart';

import '../../utils/list.dart';


class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {


  TextEditingController txtStdudentGrid = TextEditingController();
  TextEditingController txtStdudentName = TextEditingController();
  TextEditingController txtstd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:  Colors.teal,
        leading:  Icon(Icons.menu, size: 30,color: Colors.white,),
        title: const Text("Add Data Screen",style: TextStyle(color: Colors.white),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              textFieldBox(
                'Student Grid',
                  txtStdudentGrid,
                  

              ),
              textFieldBox(
                'Student Name',
                  txtStdudentName,

                 ),
              textFieldBox(
                'Student Std',
                  txtstd,

                  ),

              const SizedBox(
                height: 100,
              ),
              InkWell(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:  Colors.teal),
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                  setState(() {


                    StudentName.add(txtStdudentName.text);
                    Std.add(txtstd.text);

                  });

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget textFieldBox(String name,TextEditingController Controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      style: TextStyle(color: Colors.black),
      controller: Controller,
      decoration: InputDecoration(
          labelText: name,
       
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))
      ),
    ),
  );
}