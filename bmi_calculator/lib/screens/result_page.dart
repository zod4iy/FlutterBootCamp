import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  const ResultPage({
    Key? key,
    required this.bmi,
    required this.result,
    required this.interpretation,
  }) : super(key: key);

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
                  Text(result, style: kResultTextStyle,),
                  Text(bmi, style: kBMITextStyle,),
                  Text(interpretation, style: kBodyTextStyle,),
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
