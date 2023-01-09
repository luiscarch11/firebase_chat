import '../core/rule.dart';

class DifferentValueRule<F> extends Rule<F, String> {
  DifferentValueRule({
    required this.failure,
    required this.expectedValue,
    required String actualValue,
  }) : super(actualValue);
  final String expectedValue;
  @override
  final F failure;

  @override
  void validate() {
    isValid = value != expectedValue;
  }
}
