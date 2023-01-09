import '../core/validator.dart';
import '../core/value_object.dart';
import '../rules/required_string_rule.dart';
import '../rules/url_rule.dart';
import 'url_failure.dart';

class Url extends ValueObject<UrlFailure, String, UrlValidator> {
  Url._(this.validator);
  factory Url(String value) {
    return Url._(_validate(value));
  }
  static UrlValidator _validate(String value) {
    return UrlValidator(value);
  }

  @override
  final UrlValidator validator;
}

class UrlValidator extends Validator<UrlFailure, String> {
  UrlValidator._(
    super.value,
  ) : super(
          rules: [
            RequiredStringRule(
              const UrlFailure.empty(),
              value,
            ),
            UrlRule(
              UrlFailure.invalid(value),
              value: value,
            ),
          ],
        );

  factory UrlValidator(String value) => UrlValidator._(value)..validate();
}
