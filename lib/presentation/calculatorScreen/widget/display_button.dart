import 'package:calcu/app/colors/app_colors.dart';
import 'package:calcu/core/model/equation_model.dart';
import 'package:calcu/core/notifers/calculator_notifier.dart';
import 'package:calcu/core/notifers/equation_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayButton extends StatelessWidget {
  final CalculatorNotifier calculatorProvider;
  final String text;

  const DisplayButton({super.key, required this.calculatorProvider, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        calculatorProvider.onButtonPressed(value: text);
        if (text == '=' &&
            calculatorProvider.input != '' &&
            calculatorProvider.anyError == false) {
          Provider.of<EquationNotifier>(context, listen: false).addEquation(
            EquationModel(
              expression: calculatorProvider.input,
              value: calculatorProvider.output,
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              _isOperator(text) ? AppColors.darkGreen : AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 60,
        width: 50,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color:
                _isOperator(text) ? AppColors.whiteColor : AppColors.darkGreen,
          ),
        ),
      ),
    );
  }
}

bool _isOperator(String value) {
  return value == '/' ||
      value == '*' ||
      value == '-' ||
      value == '+' ||
      value == '=' ||
      value == '^' ||
      value == '<' ||
      value == 'C';
}
