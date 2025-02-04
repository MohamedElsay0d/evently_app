import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../provider/settings_provider.dart';
import '../../../../themes/app_theme.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final Function(DateTime?) onDateSelected;
  final Function(TimeOfDay?) onTimeSelected;

  CustomRow({
    super.key,
    required this.title,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateSelected,
    required this.onTimeSelected,
  });
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/${title.toLowerCase()}.svg',
          // rehandle
          colorFilter: ColorFilter.mode(
            Provider.of<SettingsProvider>(context).getIsDark
                ? AppTheme.white
                : AppTheme.black,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 5),
        Text(
          'Event $title',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        Spacer(),
        TextButton(
          onPressed: () async {
            if (title == 'Date') {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                initialDate: selectedDate ?? DateTime.now(),
              );
              if (pickedDate != null) {
                onDateSelected(pickedDate);
              }
            } else {
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTime ?? TimeOfDay.now(),
              );
              if (pickedTime != null) {
                onTimeSelected(pickedTime);
              }
            }
          },
          child: Text(
            title == 'Date'
                ? (selectedDate != null
                    ? dateFormat.format(selectedDate!)
                    : 'Choose Date')
                : (selectedTime != null
                    ? selectedTime!.format(context)
                    : 'Choose Time'),
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
