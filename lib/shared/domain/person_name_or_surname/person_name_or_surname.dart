import '../core/core.dart';
import '../rules/between_characters_rule.dart';
import '../rules/only_letters_rule.dart';
import '../rules/required_string_rule.dart';
import 'person_name_or_surname_failure.dart';

class PersonNameOrSurname extends ValueObject<PersonNameOrSurnameFailure, String, PersonNameOrSurnameValidator> {
  PersonNameOrSurname._(this.validator);
  factory PersonNameOrSurname(String input) {
    return PersonNameOrSurname._(_validate(input));
  }
  static PersonNameOrSurnameValidator _validate(String input) {
    final validator = PersonNameOrSurnameValidator(input);
    return validator;
  }

  static int get minCharacters => 2;
  static int get maxCharacters => 20;
  @override
  final PersonNameOrSurnameValidator validator;
}

class PersonNameOrSurnameValidator extends Validator<PersonNameOrSurnameFailure, String> {
  PersonNameOrSurnameValidator._(String value)
      : super(
          value,
          rules: [
            BetweenCharactersRule(
              PersonNameOrSurnameFailure.wrongLength(value),
              value: value,
              since: PersonNameOrSurname.minCharacters,
              until: PersonNameOrSurname.maxCharacters,
            ),
            OnlyLettersRule(
              const PersonNameOrSurnameFailure.invalid(),
              value: value,
            ),
            RequiredStringRule(
              const PersonNameOrSurnameFailure.empty(),
              value,
            ),
          ],
        );
  factory PersonNameOrSurnameValidator(String value) => PersonNameOrSurnameValidator._(value)..validate();
}
