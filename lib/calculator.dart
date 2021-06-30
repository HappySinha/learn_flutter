import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var marr = EdgeInsets.all(12);
const bodyBackground = Color(0XFF0A0E21);
const appBarBackground = Color(0XFF0A0E21);
const cardColor = Color(0xFF1D1E33);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
enum Gender { male, female }
const NumberTextStyle =
    TextStyle(fontWeight: FontWeight.w900, fontSize: 50, color: Colors.white);
const LabelTextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackground,
      appBar: AppBar(
          backgroundColor: appBarBackground, title: Text('BMI Calculator')),
      body: Column(
        children: [
          Expanded(
              child: Row(children: [
            CardBackground(
              onPress: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              colour: selectedGender == Gender.male
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: CardItem(
                gender: 'MALE',
                iconName: FontAwesomeIcons.mars,
              ),
            ),
            CardBackground(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              colour: selectedGender == Gender.female
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: CardItem(
                gender: 'FEMALE',
                iconName: FontAwesomeIcons.venus,
              ),
            )
          ])),
          CardBackground(
            colour: cardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: LabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: NumberTextStyle,
                    ),
                    Text(
                      'CM',
                      style: LabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0x99EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 30)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(children: [
            CardBackground(
              colour: cardColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT', style: LabelTextStyle),
                  Text(weight.toString(), style: NumberTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingAB(
                        fABIcon: Icons.add,
                        fAPressed: () {
                          setState(() {
                            if (weight <= 149) {
                              weight++;
                            }
                          });
                        },
                      ),
                      FloatingAB(
                        fABIcon: Icons.remove,
                        fAPressed: () {
                          setState(() {
                            if (weight >= 21) {
                              weight--;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CardBackground(
              colour: cardColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AGE', style: LabelTextStyle),
                  Text(age.toString(), style: NumberTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingAB(
                        fABIcon: Icons.add,
                        fAPressed: () {
                          setState(() {
                            if (age <= 119) {
                              age++;
                            }
                          });
                        },
                      ),
                      FloatingAB(
                        fABIcon: Icons.remove,
                        fAPressed: () {
                          setState(() {
                            if (age >= 13) {
                              age--;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ])),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIResults(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: ResultButton(
              resultText: 'CALCULATE',
            ),
          )
        ],
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  final String resultText;

  ResultButton({@required this.resultText});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEB1555),
      margin: EdgeInsets.only(top: 10.0),
      height: 80.0,
      width: double.infinity,
      child: Center(
        child: Text(
          resultText,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class FloatingAB extends StatelessWidget {
  final Function fAPressed;
  final IconData fABIcon;
  FloatingAB({@required this.fAPressed, this.fABIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Color(0xFF272740),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
            onTap: fAPressed,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  fABIcon,
                  color: Colors.white60,
                ))),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final IconData iconName;
  final String gender;
  CardItem({@required this.iconName, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          gender,
          style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0),
        )
      ],
    );
  }
}

class CardBackground extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  CardBackground({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: marr,
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

class BMIResults extends StatelessWidget {
  final String bmiResults;
  final String resultText;
  final String interpretation;
  BMIResults({@required this.resultText, this.bmiResults, this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: NumberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: Offset(0, 0)),
                ],
                borderRadius: BorderRadius.circular(14),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),
                      style: TextStyle(
                          color: Color(0xFF24D867),
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                  Text(bmiResults,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          letterSpacing: 2.2,
                          fontWeight: FontWeight.bold)),
                  Text(interpretation,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black45),
                    padding: EdgeInsets.symmetric(horizontal: 38, vertical: 16),
                    child: Text(
                      'SAVE RESULT',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white60,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: ResultButton(resultText: 'RE-CALCULATE Your BMI')),
        ],
      ),
    );
  }
}

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat bit more.';
    }
  }
}
