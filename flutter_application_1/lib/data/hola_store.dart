import 'package:flutter/material.dart';

class HolaStore extends ChangeNotifier {
  HolaStore._();
  static final instance = HolaStore._();

  static const max = 10;
  final List<String> _items = [];
  List<String> get items => List.unmodifiable(_items);
  int get length => _items.length;

  void addOne() {
    if (_items.length >= max) return;
    _items.insert(0, 'Hola Mundo');
    notifyListeners();
  }

  void addTen() {
    final free = max - _items.length;
    if (free <= 0) return;
    _items.insertAll(0, List.filled(free, 'Hola Mundo'));
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
