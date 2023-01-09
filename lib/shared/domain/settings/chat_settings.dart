abstract class ChatSettings {
  int get maximumMessageBodyLength;
}

class DefaultChatSettings implements ChatSettings {
  @override
  int get maximumMessageBodyLength => 400;
}
