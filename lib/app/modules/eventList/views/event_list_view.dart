import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/scaffold.dart';
import '../../../global_widgets/tiles/eventCard.dart';
import '../../../utilities/colors.dart';
import '../controllers/event_list_controller.dart';

class EventListView extends GetView<EventListController> {
  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      color: const Color.fromARGB(255, 226, 226, 226),
      appBar: ETAppBar(
        title: 'Explore Events',
        addBackButton: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  FormInputField(
                    label: 'Search',
                    controller: controller.searchText,
                    suffixIcon: Icons.search,
                    onClickedSuffix: controller.search,
                  ),
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapHeaderToExpand: false,
                      hasIcon: false,
                    ),
                    header: Row(
                      children: [
                        Container(
                          width: 150,
                          child: ListTile(
                            minLeadingWidth: 1,
                            leading: Icon(
                              Icons.filter_alt,
                              color: AppColors.dark50,
                            ),
                            title: Text(
                              "Filter:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: AppColors.dark50,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ExpandableButton(
                          child: Text(
                            "Categories",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    collapsed: Container(),
                    expanded: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: controller.categoriesList.length,
                        itemBuilder: (_, i) =>
                            _buildCategoryChip(controller.categoriesList[i]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            controller.filteredEvents.length == 0
                ? Center(
                    child: Text("Data Not Found"),
                  )
                : Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.filteredEvents.length,
                      itemBuilder: (_, index) {
                        print(controller.filteredEvents[index].title);
                        return EventCard(controller.filteredEvents[index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return GestureDetector(
        onTap: () => controller.pickCategory(category),
        child: Obx(
          () => Chip(
            backgroundColor: controller.checkSelectedCategory(category)
                ? AppColors.blue
                : AppColors.white,
            label: Text(
              category,
              style: TextStyle(
                  color: controller.checkSelectedCategory(category)
                      ? AppColors.dark10
                      : AppColors.dark80),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            elevation: 1,
          ).paddingOnly(right: 8),
        ));
  }
}
