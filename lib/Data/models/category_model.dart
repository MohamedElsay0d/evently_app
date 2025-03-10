import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  IconData icon;
  String image;
  Category(
      {required this.id,
      required this.name,
      required this.icon,
      required this.image});

  static final List<Category> items = [
    Category(
        id: '1',
        name: 'Sport',
        icon: Icons.pedal_bike_outlined,
        image: 'sport'),
    Category(
        id: '2',
        name: 'Birthday',
        icon: Icons.cake_outlined,
        image: 'birthday'),
    Category(
        id: '3',
        name: 'Meeting',
        icon: Icons.meeting_room_outlined,
        image: 'meeting'),
    Category(
        id: '4',
        name: 'Gaming',
        icon: Icons.videogame_asset_outlined,
        image: 'gaming'),
    Category(
        id: '5',
        name: 'Eating',
        icon: Icons.lunch_dining_outlined,
        image: 'eating'),
    Category(
        id: '6',
        name: 'WorkShop',
        icon: Icons.workspaces_outlined,
        image: 'workshop'),
  ];
}
