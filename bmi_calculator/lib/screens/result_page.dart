import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                  'Your result',
                  style: kResultsTitleTextStyle
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('OVERWEIGHT', style: kResultTextStyle,),
                  Text('26.7', style: kBMITextStyle,),
                  Text('You have bla bla bla', style: kBodyTextStyle,),
                ],
              ),
            ),
          ),
          MainBottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
