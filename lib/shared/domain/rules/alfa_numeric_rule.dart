import '../core/rule.dart';

class AlfaNumericRule<F> extends Rule<F, String> {
  AlfaNumericRule(
    this.failure, {
    required String value,
  }) : super(value);
  @override
  final F failure;
  @override
  void validate() {
    isValid = RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
  }
}
