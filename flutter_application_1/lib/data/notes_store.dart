import 'package:flutter/material.dart';

class NotesStore extends ChangeNotifier {
  NotesStore._();
  static final instance = NotesStore._();

  final List<String> _notes = [];
  List<String> get notes => List.unmodifiable(_notes);
  bool get isEmpty => _notes.isEmpty;
  int  get length => _notes.length;

  void add(String t) { _notes.insert(0, t); notifyListeners(); }
  void clear() { _notes.clear(); notifyListeners(); }
}
