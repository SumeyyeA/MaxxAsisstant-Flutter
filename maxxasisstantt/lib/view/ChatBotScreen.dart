import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter _dialogFlowtter;
  final messageInsert = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  initState() {
    super.initState();
    DialogFlowtter.fromFile().then((value) {
      _dialogFlowtter = value;
    });
  }

  void addMessage(String message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        elevation: 10,
        title: const Text("Maxx Asisstant"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) => chat(
                        messages[index]["message"].toString(),
                        messages[index]["isUserMessage"]))),
            const Divider(
              height: 6.0,
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    controller: messageInsert,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Send your message",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            setState(() {
                              addMessage(
                                messageInsert.text,
                                false,
                              );
                            });
                            DetectIntentResponse response =
                                await _dialogFlowtter.detectIntent(
                                    queryInput: QueryInput(
                                        text: TextInput(
                                            text: messageInsert.text,
                                            languageCode: "en-US")));
                            messageInsert.clear();
                            print(response);

                            if (response.message == null) return;
                            setState(() {
                              addMessage(
                                  response.message!.text!.text![0], true);
                            });
                          }
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget chat(String message, bool isUserMessage) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Bubble(
          radius: const Radius.circular(15.0),
          color: isUserMessage ? Colors.blue : Colors.orangeAccent,
          elevation: 0.0,
          alignment: isUserMessage ? Alignment.topLeft : Alignment.topRight,
          nip: isUserMessage ? BubbleNip.leftBottom : BubbleNip.rightTop,
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
                  message,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
              ],
            ),
          )),
    );
  }
}
