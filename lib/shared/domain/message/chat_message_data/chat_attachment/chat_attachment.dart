import 'dart:async';

import '../../../url/url.dart';

part "type.dart";

///Any resource other than text that's attached to a message
class ChatAttachment {
  ///Remote, public URL of the attachment
  final Url url;

  ///Specific type of the attachment.
  ///Could be any of [ChatAttachmentType.audio],
  ///[ChatAttachmentType.file], [ChatAttachmentType.image] or
  ///[ChatAttachmentType.video]
  final ChatAttachmentType type;
  ChatAttachment({
    required this.url,
    required this.type,
  });

  ChatAttachment copyWith({
    Url? url,
    ChatAttachmentType? type,
  }) {
    return ChatAttachment(
      url: url ?? this.url,
      type: type ?? this.type,
    );
  }

  @override
  String toString() => 'ChatAttachment(url: $url, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatAttachment && other.url == url && other.type == type;
  }

  @override
  int get hashCode => url.hashCode ^ type.hashCode;
}
