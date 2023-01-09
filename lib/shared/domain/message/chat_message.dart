import 'package:firebase_chat/participant/domain/chat_participant.dart';
import 'package:firebase_chat/shared/domain/message/chat_message_body/chat_message_body.dart';
import 'package:firebase_chat/shared/domain/unique_id/unique_id.dart';

import 'chat_attachment/chat_attachment.dart';
import '../settings/chat_settings.dart';
import '../../../chat.dart';

class ChatMessage {
  final UniqueId id;

  ///[ChatParticipant] who sent the [ChatMessage]
  final ChatParticipant author;

  ///Body of the [ChatMessage]. Length of the [ChatMessage] is determined by the
  ///[ChatSettings.maximumMessageBodyLength] passed to
  ///the [Chat] class
  final ChatMessageBody body;
  final DateTime sentAt;

  ///The moment the [ChatMessage] was deleted by the [author].
  ///If the [ChatMessage] was not deleted yet, [deletedAt] will be ```null```
  final DateTime? deletedAt;

  ///Resources attached to the [ChatMessage]
  final ChatAttachment? attachment;
  ChatMessage({
    required this.id,
    required this.author,
    required this.body,
    required this.sentAt,
    this.deletedAt,
    this.attachment,
  });

  ChatMessage copyWith({
    UniqueId? id,
    ChatParticipant? author,
    ChatMessageBody? body,
    DateTime? sentAt,
    DateTime? deletedAt,
    ChatAttachment? attachment,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      author: author ?? this.author,
      body: body ?? this.body,
      sentAt: sentAt ?? this.sentAt,
      deletedAt: deletedAt ?? this.deletedAt,
      attachment: attachment ?? this.attachment,
    );
  }

  @override
  String toString() {
    return 'ChatMessage(id: $id, author: $author, body: $body, sentAt: $sentAt, deletedAt: $deletedAt, attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessage &&
        other.id == id &&
        other.author == author &&
        other.body == body &&
        other.sentAt == sentAt &&
        other.deletedAt == deletedAt &&
        other.attachment == attachment;
  }

  @override
  int get hashCode {
    return id.hashCode ^ author.hashCode ^ body.hashCode ^ sentAt.hashCode ^ deletedAt.hashCode ^ attachment.hashCode;
  }
}
