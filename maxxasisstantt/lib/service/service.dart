//import 'package:dio/dio.dart';
import 'package:maxxasisstantt/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final userProvider = FutureProvider<List<UserModel>>((ref) async {
  // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
  final apiUrl = 'https://icibot.net/v2/api/profiles';

  // Replace 'YOUR_BEARER_TOKEN' with your actual bearer token
  final headers = {
    'Authorization':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJUeXBlIjoiVXNlciIsImV4cCI6MTcxODk1NTAwNCwiZXhwZCI6IjIwMjQtMDYtMjFUMDc6MzA6MDQuMjI3WiIsImlhdCI6MTY4NzQxOTAwNCwiaWQiOjI5MzR9.S213IG70Yt5ij9V3gO7jmM3H_20sZy5UYbqdZ5LXbgs',
  };

  final response = await http.get(Uri.parse(apiUrl), headers: headers);

  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    List<UserModel> userList = data.map((e) => UserModel.fromJson(e)).toList();
    return userList;
  } else {
    throw Exception('Failed to load user data');
  }
});
