import 'package:uuid/uuid.dart';

import '../core/validator.dart';
import '../core/value_object.dart';
import '../rules/required_string_rule.dart';
import 'unique_id_failure.dart';

class UniqueId extends ValueObject<UniqueIdFailure, String, UniqueIdValidator> {
  @override
  final UniqueIdValidator validator;
  UniqueId._(this.validator);
  factory UniqueId.fromString(String value) {
    return UniqueId._(_validate(value));
  }
  factory UniqueId() {
    return UniqueId._(_validate(const Uuid().v1()));
  }
  static UniqueIdValidator _validate(String value) {
    final validator = UniqueIdValidator(value);
    return validator;
  }
}

class UniqueIdValidator extends Validator<UniqueIdFailure, String> {
  UniqueIdValidator._(String value)
      : super(
          value,
          rules: [
            RequiredStringRule(const UniqueIdFailure.empty(), value),
          ],
        );

  factory UniqueIdValidator(String value) => UniqueIdValidator._(value)..validate();
}
