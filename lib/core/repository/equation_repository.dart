import 'package:calcu/core/model/equation_model.dart';
import 'package:hive/hive.dart';

class EquationRepository {
  String equationBoxName = 'equation_data';

  Future<List<EquationModel>> getAllEquations() async {
    final Box<EquationModel> equationBox =
        await Hive.openBox<EquationModel>(equationBoxName);
    final List<EquationModel> allEquations = equationBox.values.toList();
    return allEquations;
  }

  Future<void> addEquation(EquationModel equation) async {
    final Box<EquationModel> equationBox =
        await Hive.openBox<EquationModel>(equationBoxName);
    await equationBox.add(equation);
    await equationBox.close();
  }

  Future<void> clearAllEquations() async {
    final Box<EquationModel> equationBox =
        await Hive.openBox<EquationModel>(equationBoxName);
    await equationBox.clear();
  }
}
