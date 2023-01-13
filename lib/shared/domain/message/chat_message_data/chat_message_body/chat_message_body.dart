import '../../../../../chat.dart';
import '../../../core/core.dart';
import '../../../rules/rules.dart';
import 'chat_message_body_failure.dart';

class ChatMessageBody extends ValueObject<ChatMessageBodyFailure, String, ChatMessageBodyValidator> {
  ChatMessageBody._(this.validator);
  factory ChatMessageBody(String input) {
    return ChatMessageBody._(_validate(input));
  }
  static ChatMessageBodyValidator _validate(String input) {
    final validator = ChatMessageBodyValidator(input);
    return validator;
  }

  static int get maxCharacters => Chat.instance.settings.maximumMessageBodyLength;
  @override
  final ChatMessageBodyValidator validator;
}

class ChatMessageBodyValidator extends Validator<ChatMessageBodyFailure, String> {
  ChatMessageBodyValidator._(String value)
      : super(
          value,
          rules: [
            RequiredStringRule(
              const ChatMessageBodyFailure.empty(),
              value,
            ),
          ],
        );
  factory ChatMessageBodyValidator(String value) => ChatMessageBodyValidator._(value)..validate();
}
