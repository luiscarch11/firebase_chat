import '../core/rule.dart';

class ValidPhoneNumberRule<F> extends Rule<F, String> {
  ValidPhoneNumberRule(this.failure, String value) : super(value);
  @override
  final F failure;

  @override
  void validate() {
    final regexp = RegExp('^[0-9]*\$');
    isValid = regexp.hasMatch(value);
  }
}
