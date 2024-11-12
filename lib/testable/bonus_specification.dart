import 'package:specification_template/testable/amulet.dart';
import 'package:specification_template/testable/bonus.dart';
import 'package:specification_template/specification_logic.dart';

class BonusSpecification extends AbstractSpecification {
  final Bonus requiredBonus;

  BonusSpecification(this.requiredBonus);

  @override
  bool isSatisfiedBy(Object candidate) {
    if ((candidate is Amulet)) {
      return candidate.getFeatures.contains(requiredBonus);
    }
    return false;
  }
}
