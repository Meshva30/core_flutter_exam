import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../utils/list.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartSCreenState();
}

class _CartSCreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:  Colors.teal,
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
        title: const Text(
          "Student Data",
          style: TextStyle(color: Colors.white),
        ),

      ),
      body: ListView.builder(
        itemBuilder: (context, index) => productBox(index),
        itemCount: StudentName.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.teal,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('item');
        },
      ),
    );
  }

  Widget productBox(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                leading: Text(
                  '${StudentGrid[index]}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                title: Text(
                  '${StudentName[index]} Name',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                trailing: Text(
                  '${Std[index]}/-',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('edit').then((value) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                StudentGrid.removeAt(index);
                StudentName.removeAt(index);
                Std.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }
}
