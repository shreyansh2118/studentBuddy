import 'package:flutter/material.dart';

import 'calender.dart';
import 'dict.dart';
import 'task.dart';
import 'login/authFile.dart';
import 'login/loginPage.dart';
import 'notesUpload.dart';
class selectScreen extends StatefulWidget {
  const selectScreen({super.key});

  @override
  State<selectScreen> createState() => _selectScreenState();
}

class _selectScreenState extends State<selectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Features"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [


          Center(
            child: Container(
              width: 250,
              height: 60,
              child: ElevatedButton(child: Text("Task"),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },),
            ),
          ),
          SizedBox(height: 40,),

          Container(
            width: 250,
            height: 60,
            child: ElevatedButton(child: Text("Calender"),onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => calender()),
              );
            },),
          ),
          SizedBox(height: 40,),

          Container(
            width: 250,
            height: 60,
            child: ElevatedButton(child: Text("Dictionary"),onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dictionary()),
              );
            },),
          ),
          SizedBox(height: 40,),

          Container(
            width: 250,
            height: 60,
            child: ElevatedButton(child: Text("Upload Notes And Resource"),onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const notesUpload()),
              );
            },),
          ),
          SizedBox(height: 40,),


          Container(
            width: 250,
            height: 60,
            child:
            // ElevatedButton(child: Text("Logout"),onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const HomeScreen()),
            //   );
            // },),
            ElevatedButton(onPressed: (){
              emailAuth().signOut()
                  .then((result) {
                if (result == null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => loginFirst()));
                } else {
                  // Scaffold.of(context).showSnackBar(SnackBar(
                  //   content: Text(
                  //     result,
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ));
                }
              });
            }, child: Text("LogOut")),
          ),

        ],
      ),
    );
  }
}
