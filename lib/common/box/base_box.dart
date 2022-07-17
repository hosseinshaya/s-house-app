// ignore_for_file: avoid_void_async

import 'package:hive/hive.dart';

class LazyBaseBox<T> {
  LazyBaseBox(this._boxName);

  final String _boxName;
  late BoxBase<T> _box;

  Future<void> open() async {
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openLazyBox<T>(_boxName);
    }
  }

  void clear() => _box.clear();

  Future<void> removeWhere(bool Function(String key, T? value) test) async {
    for (var key in _box.keys) {
      if (test(key as String, await (_box as LazyBox<T>?)?.get(key))) {
        _box.delete(key);
      }
    }
  }

  void addAll(Iterable<T> values) => _box.addAll(values);
  Iterable<String>? get keys => _box.keys as Iterable<String>?;

  void remove(String key) => _box.delete(key);
  Future<void> close() async => _box.close();

  int get length => _box.length;
  bool get isEmpty => _box.isEmpty;
  bool get isNotEmpty => !isEmpty;

  Future<T?> first() async {
    if (_box.isEmpty) {
      return null;
    }
    return (_box as LazyBox<T>?)?.getAt(0);
  }

  bool containsKey(String key) => _box.containsKey(key);
  Future<T?> operator [](String key) async => (_box as LazyBox<T>?)?.get(key);

  void operator []=(String key, T value) async => await _box.put(key, value);
}

class BaseBox<T> {
  BaseBox(this._boxName);

  final String _boxName;
  late Box<T> _box;

  Future<void> open() async {
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox<T>(_boxName);
    }
  }

  void clear() => _box.clear();

  Future<void> removeWhere(bool Function(String key, T? value) test) async {
    for (var key in _box.keys) {
      if (test(key as String, _box.get(key))) {
        _box.delete(key);
      }
    }
  }

  void addAll(Iterable<T> values) => _box.addAll(values);

  void add(T value) => _box.add(value);

  Iterable<T> get values => _box.values;

  void setFirst(T value) => _box.clear().then((_) => _box.add(value)); // TODO

  Iterable<String>? get keys => _box.keys as Iterable<String>?;

  void remove(String key) => _box.delete(key);
  Future<void> close() async => _box.close();

  int get length => _box.length;
  bool get isEmpty => _box.isEmpty;
  bool get isNotEmpty => !isEmpty;

  T? first() {
    if (_box.isEmpty) {
      return null;
    }
    return _box.getAt(0);
  }

  bool containsKey(String key) => _box.containsKey(key);
  T? operator [](String key) => _box.get(key);

  void operator []=(String key, T value) async => await _box.put(key, value);
}

class SingletonLazyBaseBox<T> {
  SingletonLazyBaseBox(String boxName) : box = LazyBaseBox<T>(boxName);

  LazyBaseBox<T> box;

  Future<void> open() async => box.open();
  Future<void> close() async => box.close();

  void clear() => box.clear();

  Future<T?> get() => box.first();
  Future<void> set(T value) async => box['instance'] = value;
}

class SingletonBaseBox<T> {
  SingletonBaseBox(String boxName) : box = BaseBox<T>(boxName);

  BaseBox<T> box;

  Future<void> open() async => box.open();
  void close() => box.close();

  void clear() => box.clear();

  T? get() => box.first();
  Future<void> set(T value) async => box['instance'] = value;
}
