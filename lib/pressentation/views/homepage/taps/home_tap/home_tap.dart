import 'package:flutter/material.dart';

import '../../widgets/container_header.dart';
import '../../widgets/event_item.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerHeader(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return EventItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
          ),
        ),
      ],
    );
  }
}
