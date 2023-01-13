import 'package:firebase_chat/chat.dart';
import 'package:firebase_chat/shared/domain/message/chat_message.dart';
import 'package:firebase_chat/shared/domain/settings/chat_settings.dart';

import 'chat_attachment/chat_attachment.dart';
import 'chat_message_body/chat_message_body.dart';

class ChatMessageData {
  ///Resources attached to the [ChatMessage]
  final ChatAttachment? attachment;

  ///Body of the [ChatMessage]. Length of the [ChatMessage] is determined by
  ///the [ChatSettings.maximumMessageBodyLength] passed to the [Chat] class.
  final ChatMessageBody body;
  ChatMessageData({
    this.attachment,
    required this.body,
  });

  ChatMessageData copyWith({
    ChatAttachment? attachment,
    ChatMessageBody? body,
  }) {
    return ChatMessageData(
      attachment: attachment ?? this.attachment,
      body: body ?? this.body,
    );
  }

  @override
  String toString() => 'ChatMessageData(attachment: $attachment, body: $body)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessageData && other.attachment == attachment && other.body == body;
  }

  @override
  int get hashCode => attachment.hashCode ^ body.hashCode;
}
