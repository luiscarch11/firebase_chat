abstract class Rule<F, T> {
  Rule(this.value);
  final T value;

  late bool isValid;
  F get failure;
  void validate();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rule<F, T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
