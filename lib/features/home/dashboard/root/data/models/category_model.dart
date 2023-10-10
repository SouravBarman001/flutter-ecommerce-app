import 'dart:convert';

List<String> categoryModelFromJson(List<dynamic> item) =>
    List<String>.from(item.map((data) => data));

String categoryModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((data) => data)));
