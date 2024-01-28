import 'package:calcu/app/colors/app_colors.dart';
import 'package:calcu/core/model/equation_model.dart';
import 'package:calcu/core/notifers/equation_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: FutureBuilder(
        future: Provider.of<EquationNotifier>(context, listen: false)
            .getAllEquations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            return Consumer<EquationNotifier>(
              builder: (context, equationProvider, child) {
                if (equationProvider.equations.isEmpty) {
                  return const Center(
                    child: Text(
                      'No history found',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: equationProvider.equations.length,
                    itemBuilder: (context, index) {
                      EquationModel equation =
                          equationProvider.equations[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              equation.expression,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.lightGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              equation.value,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(
                              color: AppColors.darkGreen,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
