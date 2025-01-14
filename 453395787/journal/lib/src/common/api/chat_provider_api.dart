import 'package:rxdart/rxdart.dart';

import '../models/chat_view.dart';
import '../utils/typedefs.dart';

abstract class ChatProviderApi {
  ValueStream<ChatViewList> get chats;

  Future<int> addChat(ChatView chat);

  Future<void> deleteChat(int chatId);

  Future<void> updateChat(ChatView chat);
}
