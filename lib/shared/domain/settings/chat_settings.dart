import '../unique_id/unique_id.dart';

abstract class ChatSettings {
  UniqueId get currentChatParticipantId;
  int get maximumMessageBodyLength;
}

class DefaultChatSettings implements ChatSettings {
  DefaultChatSettings(this.currentChatParticipantId);

  @override
  int get maximumMessageBodyLength => 400;

  @override
  final UniqueId currentChatParticipantId;
}
