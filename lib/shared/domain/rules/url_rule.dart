import '../core/rule.dart';

class UrlRule<F> extends Rule<F, String> {
  @override
  final F failure;
  UrlRule(
    this.failure, {
    required String value,
  }) : super(value);
  @override
  void validate() {
    const regexp =
        r'^(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})$';

    isValid = RegExp(regexp).hasMatch(value);
  }
}
