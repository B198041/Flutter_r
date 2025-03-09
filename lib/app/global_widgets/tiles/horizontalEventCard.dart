import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../models/event/event.dart';
import '../../pickers/datetimepicker.dart';
import '../../routes/app_pages.dart';
import '../../utilities/colors.dart';
import '../card.dart';

class HorizontalEventCard extends StatelessWidget {
  const HorizontalEventCard(this.event);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return ETCard(
      route: Routes.EVENT_DETAIL,
      argument: event,
      width: 200,
      height: 175,
      child: Column(
        children: [
          Container(
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: event.eventProfile != null
                  ? DecorationImage(
                      image: NetworkImage(event.eventProfile!),
                      fit: BoxFit.cover,
                    )
                  : null,
              gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 2.0,
                colors: <Color>[
                  AppColors.blueAccent,
                  AppColors.blueAccent.withOpacity(0.5),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                !(event.eventProfile != null)
                    ? Expanded(
                        child: Center(
                          child: Text(
                            '${event.title}'.toUpperCase(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.titleLarge!
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      )
                    : Center(),
              ],
            ).paddingAll(4),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  event.title!,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColors.dark65,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  event.location!.location,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodyMedium,
                )
              ],
            ).paddingSymmetric(horizontal: 10),
          )
        ],
      ),
    ).paddingSymmetric(horizontal: 8, vertical: 12);
  }
}
