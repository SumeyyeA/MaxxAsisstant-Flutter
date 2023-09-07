import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxxasisstantt/model/ChatModel.dart';
import 'package:maxxasisstantt/service/service.dart';
import 'package:maxxasisstantt/model/ChatModel.dart';
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
            title: Text(
              'User Profile',
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView.separated(
            itemCount: user.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final e = user.elementAt(index);

              return ListTile(
                title: Text("${e.firstName ?? ""} ${e.lastName ?? ""}"),
                // Diğer kullanıcı bilgileri
                onTap: () async {
                  final response = await loadChatLogs(e);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessageScreen(
                        chatmodel:
                            response, // chatmodel veya gerekli verileri buradan iletebilirsiniz
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  final List<ChatModel> chatmodel;
  MessageScreen({required this.chatmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: chatmodel.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final ChatModel message = chatmodel[index];

          final isMyMessage = (message.userId ==
              message.id); // myUserId, mevcut kullanıcının kimliği

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Bubble(
                radius: const Radius.circular(15.0),
                color: isMyMessage ? Colors.blue : Colors.blue,
                elevation: 0.0,
                alignment: isMyMessage ? Alignment.topLeft : Alignment.topRight,
                nip: isMyMessage ? BubbleNip.leftBottom : BubbleNip.rightTop,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*CircleAvatar(
                  backgroundImage: AssetImage(
                      isUserMessage ? "assets/bot.png" : "assets/user.png"),
                ),*/
                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Text(
                        message.message ?? "",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
