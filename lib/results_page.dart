import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusuable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusuable_card.dart';

class  ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
    title: Text('BMI CALCULATOR'),
    ),
body:Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    Expanded(child: Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.bottomCenter,
      child: Text(
        'Your Result',
        style: kTitleTextStyle,
      ),

    ),
    ),
    Expanded(
      flex: 5,
      child: ReusuableCard(color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(resultText.toUpperCase(),
            style: kresultTextStyle,),
            Text(bmiResult,
            style: kBMITextStyle,
            ),
            Text(interpretation,
            style: kBodyTextStyle,
            textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    ),
    BottomButton(
      buttonTitle: 'RE-CALCULATE',
    onTap: (){
      Navigator.pop(context);
    },

    )
  ],
)

    );

  }
}
