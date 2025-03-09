import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/event/event.dart';
import '../../pickers/datetimepicker.dart';
import '../../routes/app_pages.dart';
import '../../utilities/colors.dart';
import '../card.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.event);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return ETCard(
      height: 110,
      addShadow: false,
      route: Routes.EVENT_DETAIL,
      argument: event,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(color: AppColors.dark65, width: 1),
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: event.eventProfile != null ? 150 : 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(),
                image: event.eventProfile != null
                    ? DecorationImage(
                        image: NetworkImage(event.eventProfile!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: !(event.eventProfile != null)
                  ? FittedBox(
                      child: Center(
                        child: Text(
                          'No Image'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: Get.textTheme.displayLarge!
                              .copyWith(color: AppColors.dark80),
                        ).paddingAll(20),
                      ),
                    )
                  : Center(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title!,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.titleLarge,
                    ),
                    Text(
                      "${event.categories!.join(", ")}",
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.titleSmall,
                    ),
                    Text(
                      event.dateTime!.dates.isNotEmpty
                          ? "${event.dateTime!.dates.formatDate}"
                          : "Date not clarified",
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${event.location!.location}",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10, vertical: 0),
              ),
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 24, vertical: 8);
  }
}
