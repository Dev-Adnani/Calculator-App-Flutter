import 'package:backdrop/backdrop.dart';
import 'package:calcu/app/colors/app_colors.dart';
import 'package:calcu/core/notifers/equation_notifer.dart';
import 'package:calcu/presentation/calculatorScreen/calculator_screen.dart';
import 'package:calcu/presentation/historyScreen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackdropScreen extends StatelessWidget {
  const BackdropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          const BackdropToggleButton(
            icon: AnimatedIcons.view_list,
          ),
          IconButton(
            onPressed: () {
              showDeleteAlert(context: context);
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.whiteColor,
            ),
          )
        ],
      ),
      backLayer: const HistoryScreen(),
      frontLayer: const CalculatorScreen(),
    );
  }

  void showDeleteAlert({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          title: const Text(
            "Confirm Delete",
            style: TextStyle(color: AppColors.whiteColor),
          ),
          content: const Text(
            "Are you sure you want to delete all equations?",
            style: TextStyle(color: AppColors.whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<EquationNotifier>(context, listen: false)
                    .clearAllEquations();
                Navigator.pop(context);
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
