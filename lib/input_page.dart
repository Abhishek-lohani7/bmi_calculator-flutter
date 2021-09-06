import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusuable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';


const bottomContainerHeight = 80.0;
const BottomCardColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF28283D);
const inactiveCardColor = Color(0xFF111328);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 70;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusuableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                  color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                cardChild: iconContents(icon:FontAwesomeIcons.mars,
                  label: 'MALE',),

              ),
              ),
              Expanded(
                child: ReusuableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                cardChild: iconContents(
                icon:FontAwesomeIcons.venus,
    label: 'FEMALE',
                ),

                ),

              ),
            ],
          ),
          ),
          Expanded(child: ReusuableCard(color: activeCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[Text('HEIGHT',
              style: kLabelTextStyle,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(height.toString(),
                  style: kNumberTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kNumberTextStyle,

                  ),
                ],
              ),

               SliderTheme(
                 data: SliderTheme.of(context).copyWith(
                   inactiveTrackColor: Color(0xFFBD8E98),
                   activeTrackColor: Colors.white,
                   thumbColor: Color(0xFFEB1555),
                   overlayColor: Color(0x15EB1555),
                   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                 ),
                 child: Slider(value: height.toDouble(),
                  min:120.0,
              max: 220.0,
              activeColor: Color(0xFFEB1455),
              inactiveColor: Color(0xFF8D8E98),
              onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
              },
              ),
               ),
              
            ] ,
          ) ,
          ),),

          Expanded(child: Row(
    children: <Widget>[
    Expanded(child: ReusuableCard(
        color: activeCardColor,
      cardChild:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('WEIGHT',
              style: kLabelTextStyle,
            ),
            Text(weight.toString(),
              style: kNumberTextStyle,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPressed: (){
                      setState(() {
                        weight--;
                      });
                    },
                ),

                SizedBox(width:10.0 ,
                ),
                RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                onPressed: (){
                      setState(() {
                        weight++;
                      });
                },),
                SizedBox(width:10.0,

                ),
              ],
            )

          ],
      ) ,

    )),
    Expanded(child: ReusuableCard(
      color: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('AGE',
          ),
          Text(age.toString(),
          style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: (){
                setState(() {
                  age--;
                },);
              }),
              SizedBox(width: 10.0,
              ),
              RoundIconButton(icon: FontAwesomeIcons.plus,
                  onPressed: (){
                setState(() {
                  age++;
                });
              }),
            ],
          )
        ],
      ),
    ),),
    ],
  ),),

          BottomButton(buttonTitle: 'CALCULATE',
            onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
              ),
              );
            },
          ),
  ],
  ),
  );

  }
}


