import 'package:firebase_chat/participant/domain/chat_participant.dart';
import 'package:firebase_chat/shared/domain/message/chat_message_data/chat_message_data.dart';
import 'package:firebase_chat/shared/domain/unique_id/unique_id.dart';

class ChatMessage {
  final UniqueId id;

  ///[ChatParticipant] who sent the [ChatMessage]
  final ChatParticipant author;

  final DateTime sentAt;

  ///The moment the [ChatMessage] was deleted by the [author].
  ///If the [ChatMessage] was not deleted yet, [deletedAt] will be ```null```
  final DateTime? deletedAt;

  ///Data explicitly written by [author] when the [ChatMessage] was redacted.
  final ChatMessageData chatMessageData;
  ChatMessage({
    required this.id,
    required this.author,
    required this.sentAt,
    this.deletedAt,
    required this.chatMessageData,
  });

  ChatMessage copyWith({
    UniqueId? id,
    ChatParticipant? author,
    DateTime? sentAt,
    DateTime? deletedAt,
    ChatMessageData? chatMessageData,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      author: author ?? this.author,
      sentAt: sentAt ?? this.sentAt,
      deletedAt: deletedAt ?? this.deletedAt,
      chatMessageData: chatMessageData ?? this.chatMessageData,
    );
  }

  @override
  String toString() {
    return 'ChatMessage(id: $id, author: $author, sentAt: $sentAt, deletedAt: $deletedAt, chatMessageData: $chatMessageData)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessage &&
        other.id == id &&
        other.author == author &&
        other.sentAt == sentAt &&
        other.deletedAt == deletedAt &&
        other.chatMessageData == chatMessageData;
  }

  @override
  int get hashCode {
    return id.hashCode ^ author.hashCode ^ sentAt.hashCode ^ deletedAt.hashCode ^ chatMessageData.hashCode;
  }
}
