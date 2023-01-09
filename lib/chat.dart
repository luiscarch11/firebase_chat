library firebase_chat;

import 'package:firebase_chat/shared/domain/settings/chat_settings.dart';

class NonInitializedChatException {}

class Chat {
  final ChatSettings settings;
  Chat._(this.settings);
  static Chat? _instance;
  static Chat get instance {
    if (_instance == null) throw NonInitializedChatException();
    return _instance!;
  }

  factory Chat.init(ChatSettings settings) {
    _instance = Chat._(settings);
    return _instance!;
  }

  @override
  String toString() => 'Chat(settings: $settings)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat && other.settings == settings;
  }

  @override
  int get hashCode => settings.hashCode;
}
