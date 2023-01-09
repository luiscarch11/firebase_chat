import '../core/rule.dart';

class ValidPhoneNumberExtensionRule<F> extends Rule<F, String> {
  ValidPhoneNumberExtensionRule(this.failure, String value) : super(value);
  @override
  final F failure;

  @override
  void validate() {
    final regexp = RegExp('^[+]{0,1}[0-9]{1,4}[0-9]*\$');
    isValid = regexp.hasMatch(value);
  }
}
