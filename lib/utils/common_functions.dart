import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_bloc_task/main.dart';

import '../model/item_element/item_element.dart';

void displaySnackBarMessage({required String message}) {
  if (navigatorKey.currentContext != null) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 14)),
    ));
  }
}

List<ItemElement> parseItems(String responseBody) {
  final data = jsonDecode(responseBody) as Map<String, dynamic>;
  final list = data['items'] as List<dynamic>;
  return list.map((e) => ItemElement.fromJson(e)).toList();
}
