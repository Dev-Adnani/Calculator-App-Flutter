// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EquationModelAdapter extends TypeAdapter<EquationModel> {
  @override
  final int typeId = 0;

  @override
  EquationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EquationModel(
      expression: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EquationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.expression)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EquationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
