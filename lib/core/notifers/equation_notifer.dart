import 'package:calcu/core/model/equation_model.dart';
import 'package:calcu/core/repository/equation_repository.dart';
import 'package:flutter/material.dart';

class EquationNotifier extends ChangeNotifier {
  final EquationRepository _equationRepository = EquationRepository();

  List<EquationModel> _equations = [];
  List<EquationModel> get equations => _equations;

  Future<void> getAllEquations() async {
    _equations = await _equationRepository.getAllEquations();
    notifyListeners();
  }

  Future<void> addEquation(EquationModel equation) async {
    await _equationRepository.addEquation(equation);
    await getAllEquations();
  }

  Future<void> clearAllEquations() async {
    await _equationRepository.clearAllEquations();
    await getAllEquations();
  }
}
