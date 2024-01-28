import 'package:calcu/core/model/equation_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveAdapters {
  static registerAdapters() {
    Hive.registerAdapter(EquationModelAdapter());
  }
}