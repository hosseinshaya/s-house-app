// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_lang_text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MultiLangTextAdapter extends TypeAdapter<MultiLangText> {
  @override
  final int typeId = 1;

  @override
  MultiLangText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MultiLangText(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MultiLangText obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fa)
      ..writeByte(1)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiLangTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
