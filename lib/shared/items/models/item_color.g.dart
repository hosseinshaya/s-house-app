// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemColor _$ItemColorFromJson(Map<String, dynamic> json) => ItemColor(
      main: const ColorConverter().fromJson(json['main'] as String),
      light: const ColorConverter().fromJson(json['light'] as String),
      dark: const ColorConverter().fromJson(json['dark'] as String),
      background: const ColorConverter().fromJson(json['background'] as String),
    );

Map<String, dynamic> _$ItemColorToJson(ItemColor instance) => <String, dynamic>{
      'main': const ColorConverter().toJson(instance.main),
      'light': const ColorConverter().toJson(instance.light),
      'dark': const ColorConverter().toJson(instance.dark),
      'background': const ColorConverter().toJson(instance.background),
    };
