abstract class Specification {
  bool isSatisfiedBy(Object candidate);

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

class AndSpecification extends Specification {
  final Specification first;
  final Specification second;

  AndSpecification(this.first, this.second);

  @override
  bool isSatisfiedBy(Object candidate) {
    return first.isSatisfiedBy(candidate) && second.isSatisfiedBy(candidate);
  }
}

class OrSpecification extends Specification {
  final Specification first;
  final Specification second;

  OrSpecification(this.first, this.second);

  @override
  bool isSatisfiedBy(Object candidate) {
    return first.isSatisfiedBy(candidate) || second.isSatisfiedBy(candidate);
  }
}

class NotSpecification extends Specification {
  final Specification spec;

  NotSpecification(this.spec);

  @override
  bool isSatisfiedBy(Object candidate) {
    return !spec.isSatisfiedBy(candidate);
  }
}
