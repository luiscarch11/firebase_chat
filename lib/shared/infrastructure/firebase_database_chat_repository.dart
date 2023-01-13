import 'package:firebase_chat/room/domain/room.dart';
import 'package:firebase_chat/participant/domain/basic_chat_participant.dart';
import 'package:firebase_chat/shared/domain/chat_repository/chat_repository.dart';
import 'package:firebase_chat/shared/domain/unique_id/unique_id.dart';
import 'package:firebase_chat/shared/domain/message/chat_message_data/chat_message_data.dart';
import 'package:firebase_chat/shared/domain/message/chat_message.dart';
import 'package:firebase_chat/shared/domain/core/result_or.dart';
import 'package:firebase_chat/shared/domain/core/resource.dart';
import 'package:firebase_chat/shared/domain/chat_repository/failures/send_message_failure.dart';
import 'package:firebase_chat/shared/domain/chat_repository/failures/room_creation_failure.dart';
import 'package:firebase_chat/shared/domain/chat_repository/failures/message_deletion_failure.dart';
import 'package:firebase_chat/shared/domain/chat_repository/failures/fetch_rooms_failure.dart';

class FirebaseDatabaseDefaultChatRepository implements ChatRepository {
  @override
  Future<Resource<RoomCreationFailure, ChatRoom>> createRoom(
    Set<BasicChatParticipant> chatParticipants,
  ) async {
    // TODO: implement createRoom
    throw UnimplementedError();
  }

  @override
  Future<Resource<RoomCreationFailure, ChatRoom>> lazyCreateRoom(
    Set<BasicChatParticipant> chatParticipants,
  ) async {
    // TODO: implement lazyCreateRoom
    throw UnimplementedError();
  }

  @override
  Future<ResultOr<MessageDeletionFailure>> deleteMessageById(
    UniqueId messageId,
  ) async {
    // TODO: implement deleteMessageById
    throw UnimplementedError();
  }

  @override
  Stream<Resource<FetchRoomsFailure, List<ChatRoom>>> fetchRooms() {
    // TODO: implement fetchRooms
    throw UnimplementedError();
  }

  @override
  void selectChatRoom(
    ChatRoom room,
  ) async {
    // TODO: implement selectChatRoom
  }

  @override
  Future<Resource<SendMessageFailure, ChatMessage>> sendMessage(
    ChatMessageData data,
  ) async {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
