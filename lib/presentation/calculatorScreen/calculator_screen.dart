import 'package:calcu/app/colors/app_colors.dart';
import 'package:calcu/core/notifers/calculator_notifier.dart';
import 'package:calcu/presentation/calculatorScreen/widget/display_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CalculatorNotfier>(
                builder: (context, calculatorProvider, _) {
                  return Text(
                    calculatorProvider.input,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.whiteColor,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CalculatorNotfier>(
                builder: (context, calculatorProvider, _) {
                  return Text(
                    calculatorProvider.output,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Consumer<CalculatorNotfier>(
              builder: (context, calculatorProvider, _) {
                return Column(
                  children: [
                    for (int i = 0;
                        i < (calculatorProvider.buttons.length / 4);
                        i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = i * 4;
                              j < (i * 4) + 4 &&
                                  j < calculatorProvider.buttons.length;
                              j++)
                            displayButton(context, calculatorProvider,
                                calculatorProvider.buttons[j]),
                        ],
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
