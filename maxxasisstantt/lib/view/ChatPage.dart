import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxxasisstantt/model/ChatModel.dart';
import 'package:maxxasisstantt/model/user_chat_log_post_model.dart';
import 'package:maxxasisstantt/service/service.dart';
import 'package:maxxasisstantt/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return userAsyncValue.when(
      data: (user) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'User Profile',
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
          body: ListView.separated(
            itemCount: user.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final e = user.elementAt(index);

              return ListTile(
                title: Text("${e.firstName ?? ""} ${e.lastName ?? ""}"),
                onTap: () async {
                  final response = await loadChatLogs(e);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessageScreen(
                        chatmodel: response,
                        name: "${e.firstName ?? ""} ${e.lastName ?? ""}",
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}

class MessageScreen extends StatefulWidget {
  final List<ChatModel> chatmodel;
  final String name;
  const MessageScreen({
    super.key,
    required this.chatmodel,
    required this.name,
  });

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.name,
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
              itemCount: widget.chatmodel.length ?? 0,
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
                            backgroundImage: AssetImage(message.avatarUrl!),
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
                    final ChatModel? postt = widget.chatmodel.first;
                    final message = _messageController.text;
                    final postModel = UserChatLogPostModel(
                      userId: postt?.userId,
                      hotelId: postt?.hotelId,
                      message: message,
                      messageType: "Message",
                      requestHeaderId: postt?.requestHeaderId,
                      userType: "user",
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
    _messageController.dispose();
    super.dispose();
  }
}
