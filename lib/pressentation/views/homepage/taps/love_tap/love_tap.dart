import 'dart:developer';

import 'package:evently_app/pressentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';


class LoveTap extends StatelessWidget {
  const LoveTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SafeArea(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Search for Event',
              icon: 'search',
              onChanged: (value) {
                log(value);
              },
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
