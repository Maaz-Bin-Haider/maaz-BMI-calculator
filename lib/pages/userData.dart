
import 'package:bmicalculator/pages/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/customWidgets/customSlider.dart';
import 'package:bmicalculator/provider/customSliderProvider.dart';

import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
class UserData extends StatefulWidget {
  final String gender;
  const UserData(
    {
    super.key,
    required this.gender

    }
    );

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      backgroundColor:backgroundColorCustom(), // Background color similar to the image
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              const CustomSlider(currentSlidervalue: 50,minimumValue: 20,maximumValue: 100,divisions: 800,category: 'Select Weight',unit: 'Kilogram',),
              const CustomSlider(currentSlidervalue: 150,minimumValue: 120,maximumValue: 200,divisions: 130,category: 'Select Height',unit: 'Centimeter',),
              const SizedBox(height: 30),
              Consumer<CustomSliderProvider>(builder: (context, value, child) {
                return SlideAction(
                  onSubmit: (){
                    value.submitFunction(widget.gender);
                    value.bmicalculator();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(),));
                  },
                  innerColor: Color.fromARGB(255, 207, 134, 24),
                  outerColor: Color.fromARGB(255, 77, 75, 75),
                  height: 82,
                  sliderButtonIconPadding: 10,
                  sliderButtonIconSize: 50,
                  
                  
                  text: 'Submit' ,textStyle: const  TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:  Color.fromARGB(214, 255, 255, 255)),
                ); 
              },)
              
              // CustomSlider(currentSlidervalue: 150,minimumValue: 120,maximumValue: 250,divisions: 130,),
            ],
          ),
        ),
      ),
    );
  }
}

Color backgroundColorCustom(){
  return const Color(0xFF2B2B2B);
}
TextStyle displayFontStyleCustom([double fontSize= 24 ,FontWeight fontWeight = FontWeight.normal]){
  return TextStyle(
    fontSize: fontSize,
    color: Colors.white,
    fontWeight: fontWeight // Similar color as in the image
  );
}
TextStyle unitsStyle([double fontSize = 18]){
  return TextStyle(
    fontSize: fontSize,
    color: Colors.white70,
  );
}
Color submitSlideBackgroungColor(){
  return const  Color.fromARGB(242, 199, 160, 20);
}