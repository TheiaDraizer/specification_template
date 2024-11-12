import 'package:flutter/material.dart';
import 'package:specification_template/testable/bonus.dart';

class Amulet {
  const Amulet(String name, List<Bonus> bonuses)
      : _nameValue = name,
        _bonusesValue = bonuses;

  final String _nameValue;
  final List<Bonus> _bonusesValue;

  String get getName => _nameValue;
  List<Bonus> get getFeatures => _bonusesValue;
}
