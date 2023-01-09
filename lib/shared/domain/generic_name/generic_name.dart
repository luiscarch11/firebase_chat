import '../core/core.dart';
import '../rules/between_characters_rule.dart';
import 'generic_name_failure.dart';

class GenericName extends ValueObject<GenericNameFailure, String, GenericNameValidator> {
  GenericName._(this.validator);
  factory GenericName(String value) {
    return GenericName._(_validate(value));
  }
  static GenericNameValidator _validate(String value) {
    final validator = GenericNameValidator(value);
    return validator;
  }

  static int get minCharacters => 2;
  static int get maxCharacters => 500;
  @override
  final GenericNameValidator validator;

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is GenericName && other.validator == validator;
  // }

  // @override
  // int get hashCode => validator.hashCode;
}

class GenericNameValidator extends Validator<GenericNameFailure, String> {
  GenericNameValidator._(String value)
      : super(
          value,
          rules: [
            BetweenCharactersRule(
              GenericNameFailure.invalidLength(value),
              value: value,
              since: GenericName.minCharacters,
              until: GenericName.maxCharacters,
            ),
          ],
        );

  factory GenericNameValidator(String value) => GenericNameValidator._(value)..validate();
}
