
import 'package:flutter/material.dart';
class CustomSliderProvider extends ChangeNotifier{
   double currentWeightSlidervalue =20;
   double currentHeightSlidervalue =120;

   double weight = 0;
   double height = 0;

   String gender = '';

   String result = "none";
   String comment = 'none';
   String finalBmi = 'none';
  
  void  weightValueChanger(double newvalue){
     currentWeightSlidervalue = newvalue;
     notifyListeners();
    
  }
  void  heightValueChanger(double newvalue){
     currentHeightSlidervalue = newvalue;
     notifyListeners();
    
  }
  void submitFunction(String userGender){
    weight = currentWeightSlidervalue;
    height = currentHeightSlidervalue;
    gender = userGender;
    print(height );
    print(weight);
    print(gender);
  }

  bmicalculator(){
    if(gender == 'male'){
      return maleBmi();
    }else{
      return femaleBMI();
    }
    
  }
  maleBmi(){
    double heightInMeter = height/100;
    double bmi = weight /(heightInMeter * heightInMeter);
    finalBmi = bmi.toStringAsFixed(2);
    if(bmi < 18.5){
      result = 'Underweight';
      comment = 'Try to gain Weight';
    }else if(bmi >=18.5 && bmi <=24.9){
      result = 'Healthy';
      comment = 'Congratulations you are Healthy';
    }else if(bmi >=25 && bmi <=29.9){
      result = 'Overweight';
      comment = 'Do some Exercise';
    }else{
      result = 'Obesity';
      comment = 'Do lots of Exercise';
    }
  }
  femaleBMI(){
    double heightInMeter = height/100;
    double bmi = weight /(heightInMeter * heightInMeter);
    finalBmi = bmi.toStringAsFixed(2);
    if(bmi < 18.5){
      result = 'Underweight';
      comment = 'Try to gain Weight';
    }else if(bmi >=18.5 && bmi <=24.9){
      result = 'Healthy';
      comment = 'Congratulations\n you are Healthy';
    }else if(bmi >=24 && bmi <=29){
      result = 'Overweight';
      comment = 'Do some Exercise';
    }else{
      result = 'Obesity';
      comment = 'Do lots of\n Exercise';
    }
  }

  Icon resultIcon(){
    if (result == 'Underweight') {
      return const Icon(
        Icons.warning,
           size: 100,
           color: Color.fromARGB(255, 176, 109, 28)
           
        );
    }else if(result == 'Healthy'){
      return const Icon(
        Icons.thumb_up,
           size: 100,
           color: Color.fromARGB(255, 25, 105, 16)
        );
    }else if(result == 'Overweight'){
      return const Icon(
        Icons.accessibility_new,
           size: 100,
           color: Color.fromARGB(255, 167, 61, 26)
        );
    }else{
      return const Icon(
        Icons.warning,
           size: 100,
           color: Color.fromARGB(255, 155, 23, 23)
        );
    }
    
  }
  
}