import 'package:calcu/core/notifers/calculator_notifier.dart';
import 'package:calcu/core/notifers/equation_notifer.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => CalculatorNotifier()),
    ChangeNotifierProvider(create: (_) => EquationNotifier()),
  ];
}
