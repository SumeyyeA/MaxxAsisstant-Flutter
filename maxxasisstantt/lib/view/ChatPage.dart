import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
                onTap: () {
                  // Tıklanan kullanıcıya özel bir işlem yapabilirsiniz
                  // Örneğin, kullanıcıyı profil sayfasına yönlendirebilirsiniz
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
