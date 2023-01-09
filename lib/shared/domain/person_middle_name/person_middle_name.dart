import '../core/core.dart';
import '../rules/between_characters_rule.dart';

import '../rules/regexp_rule.dart';
import '../rules/required_string_rule.dart';
import 'person_middle_name_failure.dart';

class PersonMiddleName extends ValueObject<PersonMiddleNameFailure, String, PersonMiddleNameValidator> {
  PersonMiddleName._(this.validator);
  factory PersonMiddleName(String input) {
    return PersonMiddleName._(_validate(input));
  }
  static PersonMiddleNameValidator _validate(String input) {
    final validator = PersonMiddleNameValidator(input);
    return validator;
  }

  static int get minCharacters => 1;
  static int get maxCharacters => 20;
  @override
  final PersonMiddleNameValidator validator;
}

class PersonMiddleNameValidator extends Validator<PersonMiddleNameFailure, String> {
  PersonMiddleNameValidator._(String value)
      : super(
          value,
          rules: [
            BetweenCharactersRule(
              PersonMiddleNameFailure.wrongLength(value),
              value: value,
              since: PersonMiddleName.minCharacters,
              until: PersonMiddleName.maxCharacters,
            ),
            RegExpRule(
              const PersonMiddleNameFailure.invalid(),
              regExp: RegExp(r'^([A-Za-záéíóú ]+[.]{0,1})$'),
              value: value,
            ),
            RequiredStringRule(
              const PersonMiddleNameFailure.empty(),
              value,
            ),
          ],
        );
  factory PersonMiddleNameValidator(String value) => PersonMiddleNameValidator._(value)..validate();
}
