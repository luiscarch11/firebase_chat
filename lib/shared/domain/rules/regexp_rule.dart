import '../core/rule.dart';

class RegExpRule<F> extends Rule<F, String> {
  RegExpRule(
    this.failure, {
    required this.regExp,
    required String value,
  }) : super(value);
  @override
  final F failure;
  final RegExp regExp;
  @override
  void validate() {
    isValid = regExp.hasMatch(value);
  }
}
