import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'category_model.dart';

class EventModel {
  String id;
  String userId ;
  String title;
  String description;
  DateTime date;
  TimeOfDay time;
  Category category;

  EventModel({
    this.id = '',
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
  });

  late Timestamp dateTime;
  DateTime _dateTime = DateTime.now();
  Map<String, dynamic> toJson() {
    _dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    dateTime = Timestamp.fromDate(_dateTime);
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'categoryId': category.id,
      'dateTime': dateTime,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    Timestamp dateTime = json['dateTime'];
    DateTime date = dateTime.toDate();
    TimeOfDay time = TimeOfDay.fromDateTime(date);
    return EventModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      date: date,
      time: time,
      category: Category.items
          .firstWhere((category) => category.id == json['categoryId']),
    );
  }
}
