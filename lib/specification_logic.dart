import 'package:flutter/material.dart';
import 'package:specification_template/amulet.dart';
import 'package:specification_template/bonus.dart';

mixin Specification {
  bool isSatisfiedBy(Object candidate);

  Specification and(Specification other);
  Specification or(Specification other);
  Specification not();
}

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

abstract class AbstractSpecification with Specification {
  Specification and(Specification other) {
    return AndSpecification(this, other);
  }

  Specification or(Specification other) {
    return OrSpecification(this, other);
  }

  Specification not() {
    return NotSpecification(this);
  }
}

/* ------------------------------------ . ----------------------------------- */
class AndSpecification extends AbstractSpecification {
  final Specification first;
  final Specification second;

  AndSpecification(this.first, this.second);

  @override
  bool isSatisfiedBy(Object candidate) {
    return first.isSatisfiedBy(candidate) && second.isSatisfiedBy(candidate);
  }
}

class OrSpecification extends AbstractSpecification {
  final Specification first;
  final Specification second;

  OrSpecification(this.first, this.second);

  @override
  bool isSatisfiedBy(Object candidate) {
    return first.isSatisfiedBy(candidate) || second.isSatisfiedBy(candidate);
  }
}

class NotSpecification extends AbstractSpecification {
  final Specification spec;

  NotSpecification(this.spec);

  @override
  bool isSatisfiedBy(Object candidate) {
    return !spec.isSatisfiedBy(candidate);
  }
}
