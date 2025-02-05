import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Data/models/event_model.dart';
import '../../../provider/event_provider.dart';
import '../../../themes/app_theme.dart';
import 'edit_event.dart';
import 'widgets/detect_location.dart';

class EventDetails extends StatelessWidget {
  static const String routeName = 'event_details';
  EventDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    EventModel event = ModalRoute.of(context)!.settings.arguments as EventModel;
    bool isEditable = FirebaseAuth.instance.currentUser!.uid == event.userId;
    TextTheme textTheme = Theme.of(context).textTheme;
    final formattedDate = DateFormat('d MMMM y').format(event.date);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.eventDetails,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppTheme.primaryColor),
        ),
        actions: isEditable
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return EditEvent(event);
                    }));
                  },
                  icon: Icon(
                    Icons.edit_sharp,
                    color: AppTheme.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<EventsProvider>(context, listen: false)
                        .deleteEvent(event);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppTheme.red,
                  ),
                ),
              ]
            : [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/${event.category.image}.png'),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    event.title,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 8),
              DetectLocationTime(
                title: formattedDate,
                subtitle: event.time.format(context),
                image: 'calendar',
              ),
              SizedBox(height: 8),
              DetectLocationTime(
                title: 'detect later',
                image: 'location',
              ),
              SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.description,
                style: textTheme.bodyLarge,
              ),
              SizedBox(height: 5),
              Expanded(
                child: Text(
                  event.description,
                  style: textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
