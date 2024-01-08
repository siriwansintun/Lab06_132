import 'package:flutter/material.dart';
import 'package:lab06_132/pages/hobby.dart';
class FirstPages extends StatefulWidget {
  const FirstPages({super.key});

  @override
  State <FirstPages> createState() =>  FirstPagesState();
}

class  FirstPagesState extends State <FirstPages> {
  List<Hobby> hobbies = [];
   List selectedItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hobbies = Hobby.getHobby();
    print(hobbies);
  }

  List<Widget> creatHobbyCheckbox(){
    List<Widget> mywidget = [];
   

    for (var hb in hobbies){
      mywidget.add(
        CheckboxListTile(
          title: Text(hb.name),
          value: hb.checked, 
          onChanged: (value) {

            setState(() {
              hb.checked = value!;
              if (value == true){
                selectedItems.add(hb.name);
              }else{
                selectedItems.remove(hb.name);
              }

            });
          
        },)
      );

    }

    return mywidget;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(




      appBar:AppBar(
        title: const Text("lab06 CheckboxListTile"),
      ),
      body: Column(
        children:[
          const Text("งานอดิเรก"),
          Column(
            children: creatHobbyCheckbox(),
          ),
          Text(selectedItems.toString())
        ],
        ),
    );
  }
}