import 'package:flutter/material.dart';
import '../models/registration.dart';

class RegistrationStore extends ChangeNotifier {
  RegistrationStore._();
  static final instance = RegistrationStore._();

  final List<Registration> _items = [];
  List<Registration> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;
  int  get length  => _items.length;

  void add(Registration r) { _items.insert(0, r); notifyListeners(); }
  void clear() { _items.clear(); notifyListeners(); }
}
