import 'package:firebase_chat/participant/domain/basic_chat_participant.dart';
import 'package:firebase_chat/room/domain/room.dart';
import 'package:firebase_chat/shared/domain/core/core.dart';
import 'package:firebase_chat/shared/domain/message/chat_message.dart';
import 'package:firebase_chat/shared/domain/message/chat_message_data/chat_message_data.dart';
import 'package:firebase_chat/shared/domain/settings/chat_settings.dart';
import 'package:firebase_chat/shared/domain/unique_id/unique_id.dart';

import 'failures/fetch_rooms_failure.dart';
import 'failures/message_deletion_failure.dart';
import 'failures/room_creation_failure.dart';
import 'failures/send_message_failure.dart';

///Interface for interacting with the database. You can implement it
///in case you want to create your own implementation of its methods
abstract class ChatRepository {
  ///Creates a new room between two or more [chatParticipants].
  ///Returns [RoomCreationFailureRoomAlreadyExists] as [ResourceFailure]
  ///value if a room with these participants already exists
  Future<Resource<RoomCreationFailure, ChatRoom>> createRoom(
    Set<BasicChatParticipant> chatParticipants,
  );

  ///Creates a new room between two or more [chatParticipants]. Similar to
  ///[createRoom], but [lazyCreateRoom] won't return a [RoomCreationFailureRoomAlreadyExists]
  ///if the room is already created. Instead, it will return this already-created
  ///room as a [ResourceSuccess]
  Future<Resource<RoomCreationFailure, ChatRoom>> lazyCreateRoom(
    Set<BasicChatParticipant> chatParticipants,
  );

  ///Returns a [Stream] with the rooms the [ChatSettings.currentChatParticipantId]
  ///participates in.
  Stream<Resource<FetchRoomsFailure, List<ChatRoom>>> fetchRooms();

  ///[sendMessage] will send messages to the `id` of specified [room] here.
  void selectChatRoom(ChatRoom room);

  ///Sends a new message to the id of the [ChatRoom] specified in the
  ///[selectChatRoom] method
  Future<Resource<SendMessageFailure, ChatMessage>> sendMessage(
    ChatMessageData data,
  );
  Future<ResultOr<MessageDeletionFailure>> deleteMessageById(
    UniqueId messageId,
  );
}
