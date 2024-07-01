// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeSettingsAdapter extends TypeAdapter<TimeSettings> {
  @override
  final int typeId = 0;

  @override
  TimeSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeSettings(
      bedTime: fields[0] as DateTime,
      wakeUpTime: fields[1] as DateTime,
      activeDays: (fields[2] as List).cast<bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, TimeSettings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bedTime)
      ..writeByte(1)
      ..write(obj.wakeUpTime)
      ..writeByte(2)
      ..write(obj.activeDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
