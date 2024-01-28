import 'package:hive_flutter/hive_flutter.dart';
part 'equation_model.g.dart';

@HiveType(typeId: 0)
class EquationModel {
  @HiveField(0)
  final String expression;
  @HiveField(1)
  final String value;

  const EquationModel({required this.expression, required this.value});
}
