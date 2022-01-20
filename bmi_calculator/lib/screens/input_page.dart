import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/result_page.dart';

enum Gender { male, female }
enum ActionType {
  increaseWeight,
  decreaseWeight,
  increaseAge,
  decreaseAge,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  void _updateValueFor({required ActionType action}) {
    setState(() {
      if (action == ActionType.increaseWeight) {
        weight++;
      } else if (action == ActionType.decreaseWeight && weight > 0) {
        weight--;
      } else if (action == ActionType.increaseAge) {
        age++;
      } else if (action == ActionType.decreaseAge && age > 0) {
        age--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onCardPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onCardPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumbersTextStyle),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumbersTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                _updateValueFor(
                                    action: ActionType.decreaseWeight);
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              onPressed: () {
                                _updateValueFor(
                                    action: ActionType.increaseWeight);
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumbersTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                _updateValueFor(action: ActionType.decreaseAge);
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              onPressed: () {
                                _updateValueFor(action: ActionType.increaseAge);
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MainBottomButton(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBrain calculator = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmi: calculator.calculateBMI(),
                    result: calculator.getResult(),
                    interpretation: calculator.getInterpretation(),
                  )));
            },
          ),
        ],
      ),
    );
  }
}
