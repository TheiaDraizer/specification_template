abstract class AbstractSpecification {
  bool isSatisfiedBy(Object candidate);

  AbstractSpecification and(AbstractSpecification other) {
    return AndSpecification(this, other);
  }

  AbstractSpecification or(AbstractSpecification other) {
    return OrSpecification(this, other);
  }

  AbstractSpecification not() {
    return NotSpecification(this);
  }
}

class AndSpecification extends AbstractSpecification {
  final AbstractSpecification first;
  final AbstractSpecification second;

  AndSpecification(this.first, this.second);

  @override
  bool isSatisfiedBy(Object candidate) {
    return first.isSatisfiedBy(candidate) && second.isSatisfiedBy(candidate);
  }
}

class OrSpecification extends AbstractSpecification {
  final AbstractSpecification first;
  final AbstractSpecification second;

  OrSpecification(this.first, this.second);

  @override
  bool isSatisfiedBy(Object candidate) {
    return first.isSatisfiedBy(candidate) || second.isSatisfiedBy(candidate);
  }
}

class NotSpecification extends AbstractSpecification {
  final AbstractSpecification spec;

  NotSpecification(this.spec);

  @override
  bool isSatisfiedBy(Object candidate) {
    return !spec.isSatisfiedBy(candidate);
  }
}
