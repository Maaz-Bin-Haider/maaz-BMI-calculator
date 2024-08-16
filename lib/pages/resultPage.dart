import 'package:bmicalculator/pages/userData.dart';
import 'package:bmicalculator/provider/customSliderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColorCustom(),
        leading: Material(
          type: MaterialType.transparency,
          child: IconButton(
            splashColor:const Color.fromARGB(0, 0, 0, 0) ,
            highlightColor: Colors.transparent,
            onPressed: (){ Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios_new_sharp,color: Colors.white, size: 30,),
          ),
        ),
      ),
      backgroundColor:backgroundColorCustom(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Report' , style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w800),),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 134, 24),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Consumer<CustomSliderProvider>(builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your BMI is ${value.finalBmi}' ,style: resultStyle(35),),
                  Text('Report ${value.result}',style: resultStyle()),
                  Text('${value.comment}',style: resultStyle())
                ],
              );
              },)
            ),
            const SizedBox(height: 20,),
            Consumer<CustomSliderProvider>(builder: (context, value2, child) {
              return value2.resultIcon();
            },)
          ],
        )
      ),
    );
    
  }
}
TextStyle resultStyle([double size = 25]){
  return TextStyle(
    color: Color.fromARGB(255, 64, 63, 63),
    fontSize: size,
    fontWeight: FontWeight.w700
    
  );
}