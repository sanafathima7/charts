// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChartData1Adapter extends TypeAdapter<ChartData1> {
  @override
  final int typeId = 1;

  @override
  ChartData1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChartData1(
      chartType: fields[0] as String,
      xValue: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChartData1 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.chartType)
      ..writeByte(1)
      ..write(obj.xValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartData1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
