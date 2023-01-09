import '../core/rule.dart';

class EqualValueRule<F> extends Rule<F, String> {
  EqualValueRule({
    required this.failure,
    required this.expectedValue,
    required String actualValue,
  }) : super(actualValue);
  final String expectedValue;
  @override
  final F failure;

  @override
  void validate() {
    isValid = super.value == expectedValue;
  }
}
