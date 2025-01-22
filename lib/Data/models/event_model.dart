import 'package:flutter/material.dart';

import 'category_model.dart';

class EventModel {
  String? id;
  String title;
  String description;
  DateTime date;
  TimeOfDay time;
  Category category;

  EventModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    DateTime dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryId': category.id,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateTime.parse(json['dateTime']);
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['categoryId'],
      date: DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      ),
      time: TimeOfDay(
        hour: dateTime.hour,
        minute: dateTime.minute,
      ),
    );
  }

  @override
  String toString() {
    return 'EventModel{id: $id, title: $title, description: $description, date: $date, time: $time, category: $category}';
  }
}
