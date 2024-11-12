import 'package:specification_template/testable/amulet.dart';
import 'package:specification_template/testable/bonus.dart';
import 'package:specification_template/testable/bonus_specification.dart';
import 'package:specification_template/specification_logic.dart';

abstract class Specifications {
  static Specification amuletSpec() {
    Specification luckySpec = BonusSpecification(const LuckyBonus());
    Specification aimSpec = BonusSpecification(const AimBonus());
    Specification moneySpec = BonusSpecification(const MoneyBonus());
    Specification speedSpec = BonusSpecification(const SpeedBonus());
    Specification healthSpec = BonusSpecification(const HealthBonus());
    Specification staminaSpec = BonusSpecification(const StaminaBonus());
    Specification moneyOrLuckySpec = luckySpec.or(moneySpec);
    Specification noFullBodySpec =
        speedSpec.and(healthSpec).and(staminaSpec).and(aimSpec).not();
    Specification finalSpec = noFullBodySpec.and(moneyOrLuckySpec);
    return finalSpec;
  }
}
