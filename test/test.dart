import 'package:flutter_test/flutter_test.dart';
import 'package:specification_template/specification_logic.dart';
import 'package:specification_template/testable/amulet.dart';
import 'package:specification_template/testable/bonus.dart';
import 'package:specification_template/testable/bonus_specification.dart';

void main() {
  group('Specifications.amuletSpec', () {
    AbstractSpecification luckySpec = BonusSpecification(const LuckyBonus());
    AbstractSpecification aimSpec = BonusSpecification(const AimBonus());
    AbstractSpecification moneySpec = BonusSpecification(const MoneyBonus());
    AbstractSpecification speedSpec = BonusSpecification(const SpeedBonus());
    AbstractSpecification healthSpec = BonusSpecification(const HealthBonus());
    AbstractSpecification staminaSpec =
        BonusSpecification(const StaminaBonus());
    AbstractSpecification moneyOrLuckySpec = luckySpec.or(moneySpec);
    AbstractSpecification noFullBodySpec =
        speedSpec.and(healthSpec).and(staminaSpec).and(aimSpec).not();
    // Specification all
    AbstractSpecification finalSpec = noFullBodySpec.and(moneyOrLuckySpec);

    test('should only satisfy amulet with LuckyBonus or MoneyBonus', () {
      Amulet amulet = const Amulet('2', [HealthBonus(), StaminaBonus()]);
      expect(finalSpec.isSatisfiedBy(amulet), isFalse);
    });

    test('should not satisfy amulet with full body bonuses', () {
      Amulet amulet = const Amulet('1', [
        HealthBonus(),
        StaminaBonus(),
        AimBonus(),
        SpeedBonus(),
        MoneyBonus()
      ]);
      expect(finalSpec.isSatisfiedBy(amulet), isFalse);
    });

    test('should satisfy amulet with LuckyBonus and MoneyBonus', () {
      Amulet amulet = const Amulet('1', [LuckyBonus(), MoneyBonus()]);
      expect(finalSpec.isSatisfiedBy(amulet), isTrue);
    });

    test(
        'should satisfy amulet with LuckyBonus and MoneyBonus and no full body bonuses',
        () {
      Amulet amulet = const Amulet('1', [
        LuckyBonus(),
        MoneyBonus(),
        HealthBonus(),
        StaminaBonus(),
        SpeedBonus()
      ]);
      expect(finalSpec.isSatisfiedBy(amulet), isTrue);
    });
  });
}
