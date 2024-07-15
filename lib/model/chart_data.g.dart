// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChartDataAdapter extends TypeAdapter<ChartData> {
  @override
  final int typeId = 0;

  @override
  ChartData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChartData(
      chartType: fields[0] as String,
      xValue: (fields[1] as List).cast<String>(),
      yValue: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChartData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.chartType)
      ..writeByte(1)
      ..write(obj.xValue)
      ..writeByte(2)
      ..write(obj.yValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
