import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxxasisstantt/app/utils/enums/message_type_enum.dart';
import 'package:maxxasisstantt/app/utils/enums/user_type_enum.dart';
import 'package:maxxasisstantt/app/utils/extension/build_context_extension.dart';
import 'package:maxxasisstantt/model/ChatModel.dart';
import 'package:maxxasisstantt/model/user_chat_log_post_model.dart';
import 'package:maxxasisstantt/service/service.dart';
import 'package:maxxasisstantt/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UserListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Users',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: userAsyncValue.when(
        data: (user) {
          return ListView.separated(
            itemCount: user.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final e = user[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(e.profilePicUrl ?? ""), // Avatar eklemek
                ),
                title: Text("${e.firstName ?? ""} ${e.lastName ?? ""}"),
                onTap: () async {
                  final response = await loadChatLogs(e);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessageScreen(
                        chatmodel: response,
                        userModel: e,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class MessageScreen extends StatefulWidget {
  final List<ChatModel> chatmodel;
  final UserModel userModel;

  const MessageScreen({
    Key? key, // 'super.key' hatası düzeltildi
    required this.chatmodel,
    required this.userModel,
  });

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  late WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    _startWebSocket();
  }

  void _startWebSocket() {
    String webSocketUrl =
        'wss://icibot.net/hot_support/${widget.userModel.id ?? -1}/ws';
    _channel = IOWebSocketChannel.connect(webSocketUrl);

    _channel.stream.listen((message) {
      _handleReceivedMessage(message);
    });
  }

  void _handleReceivedMessage(String message) {
    // Mesajı mesaj listesine eklemek gibi

    setState(() {
      // Örnek: widget.chatmodel listesine yeni bir mesaj ekleyin
      widget.chatmodel.add(ChatModel.fromJson(jsonDecode(message)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "${widget.userModel.firstName ?? ""} ${widget.userModel.lastName ?? ""}",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.chatmodel.length,
              itemBuilder: (BuildContext context, int index) {
                final ChatModel message = widget.chatmodel[index];
                final isMyMessage = (message.userId == message.id);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Bubble(
                    radius: const Radius.circular(15.0),
                    color: isMyMessage ? Colors.blue : Colors.blue,
                    elevation: 0.0,
                    alignment:
                        isMyMessage ? Alignment.topLeft : Alignment.topRight,
                    nip:
                        isMyMessage ? BubbleNip.leftBottom : BubbleNip.rightTop,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircleAvatar(
                              //backgroundImage: AssetImage(message.avatarUrl!),
                              ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: Text(
                              message.message ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Mesajınızı buraya girin...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final ChatModel? postt = widget.chatmodel.isNotEmpty
                        ? widget.chatmodel.first
                        : null; // chatmodel boş ise postt null olacak
                    final message = _messageController.text;
                    final postModel = UserChatLogPostModel(
                      userId: postt?.userId,
                      hotelId: postt?.hotelId,
                      message: message,
                      messageType: MessageType.message.getApiKey,
                      requestHeaderId: postt?.requestHeaderId,
                      userType: UserType.user.getApiKey,
                      recordType: "HotSupport",
                    );

                    postChat(postModel, message);

                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Ekran kapatıldığında WebSocket kanalını kapatın
    _channel.sink.close();
    super.dispose();
  }
}
