import 'package:flutter/material.dart';
import 'package:specification_template/testable/amulet.dart';
import 'package:specification_template/testable/bonus.dart';
import 'package:specification_template/specification_logic.dart';
import 'package:specification_template/testable/complex_specification.dart';

//! Domain-driven design, specification, runtime evaluation

void main() {
  Amulet amulet1 = const Amulet('1', [LuckyBonus(), AimBonus(), SpeedBonus()]);
  Amulet amulet2 = const Amulet('1', [HealthBonus(), StaminaBonus()]);
  Amulet amulet3 = const Amulet('2',
      [StaminaBonus(), HealthBonus(), AimBonus(), SpeedBonus(), MoneyBonus()]);
  Amulet amulet4 = const Amulet(
      '3', [StaminaBonus(), HealthBonus(), AimBonus(), MoneyBonus()]);

  List<Amulet> amulets = [amulet1, amulet2, amulet3, amulet4];

  for (Amulet amulet in amulets) {
    print(Specifications.amuletSpec().isSatisfiedBy(amulet));
  }
}
