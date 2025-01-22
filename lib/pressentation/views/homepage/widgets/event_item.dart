import 'package:evently_app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Data/models/event_model.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/${event.category.image}.png',
          ),
        ),
        Container(
          height: 49,
          width: 45,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.white,
          ),
          child: Column(
            children: [
              Text(
                event.date.day.toString().padLeft(2, '0'),
                style: textTheme.titleLarge?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('MMM').format(event.date),
                style: textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 4,
          height: 56,
          width: MediaQuery.of(context).size.width - 32,
          left: 4,
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.white,
            ),
            child: Row(children: [
              Expanded(
                child: Text(
                  event.title,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: AppTheme.primaryColor,
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
