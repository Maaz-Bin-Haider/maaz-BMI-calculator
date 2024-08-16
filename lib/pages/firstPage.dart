
import 'package:bmicalculator/pages/userData.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: backgroundColorCustom(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Gender" ,style: displayFontStyleCustom(38,FontWeight.bold)),
            const SizedBox(height: 40,),
            Material(
              type: MaterialType.transparency,
              child: IconButton(
                
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserData(gender: 'male',),));
                },
               icon: Container(
                padding: const EdgeInsets.all(8),
                height: 120,width: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 175, 123, 26),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.male,size: 60,color: backgroundColorCustom(), ),
                      Text(
                        'Male',
                        style:TextStyle(
                          color: backgroundColorCustom(),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        )
                      )
                    ],
                ),
               ),
               
                splashColor:Colors.transparent ,
                highlightColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 30,),
            Material(
              type: MaterialType.transparency,
              child: IconButton(
                
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserData(gender: 'female',),));
                },
              
               icon: Container(
                padding: const EdgeInsets.all(8),
                height: 120,width: 200,
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 175, 123, 26),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.female,size: 60,color: backgroundColorCustom(),),
                      Text(
                        'Female',
                        style:TextStyle(
                          color: backgroundColorCustom(),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        )
                      )
                    ],
                ),
               ),
               splashColor:const Color.fromARGB(0, 0, 0, 0) ,
               highlightColor: Colors.transparent,
               ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}