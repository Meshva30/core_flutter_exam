



import 'package:core_flutter_exam/utils/list.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

TextEditingController txtStdudentGrid = TextEditingController();
TextEditingController txtStdudentName = TextEditingController();
TextEditingController txtstd = TextEditingController();

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.of(context).pushNamed('add');
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Student Data",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: StudentName.length,
          itemBuilder: (context, index) => item(index),
        ));
  }

  Column item(int index) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 80,
              width: 410,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img/img2.png'),
                ),

                title: Text(
                  '${StudentName[index]}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${Std[index]}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          AlatDialogBox(context);
                        },
                        child: Icon(Icons.edit)),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            StudentName.removeAt(index);
                            Std.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  void AlatDialogBox(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Update Dialog'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/img/img2.png'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtStdudentGrid,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtStdudentName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtstd,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {

              }, child: Text('Update')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'))
            ],
          ),
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context)
        {
          return alert;
        }
    );
  }
}