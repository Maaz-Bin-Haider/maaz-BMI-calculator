
import 'package:bmicalculator/pages/userData.dart';
import 'package:bmicalculator/provider/customSliderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomSlider extends StatefulWidget {
  final String category;
  final String unit;
  final double currentSlidervalue;
  final double minimumValue;
  final double maximumValue;
  final int divisions;
  const CustomSlider(
    
    {
    super.key,
    required this.category,
    required this.unit,
    required this.currentSlidervalue,
    required this.minimumValue,
    required this.maximumValue,
    required this.divisions,
    }
    );

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.category,
          style: displayFontStyleCustom(),
        ),
        const SizedBox(height: 20),
        Consumer<CustomSliderProvider>(builder: (context, currentvalueProvided, child) {
          return Text(
          widget.unit == 'Kilogram'? currentvalueProvided.currentWeightSlidervalue.toStringAsFixed(1):currentvalueProvided.currentHeightSlidervalue.toStringAsFixed(2) ,
          style: displayFontStyleCustom(48,FontWeight.bold),
        );
        },),
        Text(
          widget.unit,
          style: unitsStyle(18)
        ),
        const SizedBox(height: 20),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            
            activeTrackColor: Color.fromARGB(255, 207, 134, 24),
            inactiveTrackColor: Color.fromARGB(223, 176, 142, 68),
            trackHeight: 8.0,
            thumbShape:const  RoundSliderThumbShape(enabledThumbRadius: 10.0),
            thumbColor: Color.fromARGB(255, 129, 68, 3),
            overlayColor: Colors.white.withAlpha(32),
            overlayShape:const RoundSliderOverlayShape(overlayRadius: 24.0),
            tickMarkShape:const RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.white,
            inactiveTickMarkColor: Colors.grey[700],
            
          ),
          child:Consumer<CustomSliderProvider>(builder: (context, custom, child) {
            return Slider(
            value:   widget.unit == 'Kilogram'? custom.currentWeightSlidervalue:custom.currentHeightSlidervalue,
            min: widget.minimumValue,
            max: widget.maximumValue,
            
            divisions: widget.divisions,
            label:widget.unit == 'Kilogram'? custom.currentWeightSlidervalue.toStringAsFixed(1):custom.currentHeightSlidervalue.toStringAsFixed(1),
            onChanged: (double value) {
              widget.unit == 'Kilogram'? custom.weightValueChanger(value):custom.heightValueChanger(value);
              
            },
          );
          },)

        ),
        const SizedBox(height: 50),
      ],
    );
    
  }
}

