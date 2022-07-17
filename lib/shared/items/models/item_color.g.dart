// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemColorAdapter extends TypeAdapter<ItemColor> {
  @override
  final int typeId = 2;

  @override
  ItemColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemColor(
      fields[0] as Color,
      fields[1] as Color,
      fields[2] as Color,
      fields[3] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, ItemColor obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.main)
      ..writeByte(1)
      ..write(obj.light)
      ..writeByte(2)
      ..write(obj.dark)
      ..writeByte(3)
      ..write(obj.background);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
