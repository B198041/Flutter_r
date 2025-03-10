import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimePicker {
  /// Displays a single DatePicker
  /// Returns a `list of Iso8601String (A String type for DateTime) of length 1` if a date is picked.
  static Future<List<String>> datePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate:
          DateTime.now().add(Duration(days: 1)), // Equivalent to Date.tomorrow
      firstDate: DateTime.now(), // Equivalent to Date.today
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialEntryMode: DatePickerEntryMode.calendar,
    ).then((value) => value != null ? [value.toIso8601String()] : []);
  }

  /// Displays a DateRangePicker
  /// Returns a `list of Iso8601String (A String type for DateTime) of length 2(Start Date and End Date)` if both dates are picked.
  static Future<List<String>> dateRangePicker(BuildContext context,
      {List<String>? selectedDateRange = const []}) async {
    return await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDateRange: selectedDateRange!.isNotEmpty
          ? DateTimeRange(
              start: DateTime.parse(selectedDateRange[0]),
              end: DateTime.parse(selectedDateRange[1]),
            )
          : null,
    ).then((value) => value != null
        ? [value.start.toIso8601String(), value.end.toIso8601String()]
        : []);
  }

  /// Displays 2 TimePickers (one after the other).
  /// Returns a `list of TimeOfDay of length 2(Start Time and End Time)` if both times are picked.
  static Future<List<String>> timePicker(BuildContext context) async {
    List<String> times = [];
    TimeOfDay? start = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 00),
      helpText: 'Select Start Time',
    );
    if (start != null) {
      TimeOfDay? end = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: start.hour + 2, minute: start.minute),
        helpText: 'Select End Time',
      );
      if (end != null) times = [start, end].formatTime;
    }
    return times;
  }
}

extension DateFormat on List<String> {
  /// Returns a list of formatted Dates - Example: [Monday, Jul 28, 2021]
  List<String> get formatDate {
    List<String> dates = [];
    this.forEach((element) =>
        dates.add(DateTime.parse(element).toLocal().toIso8601String()));
    return dates;
  }

  /// Returns the difference of days between 2 dates.
  int get difference =>
      this.parseDate[1].difference(this.parseDate[0]).inDays + 1;
}

extension TimeFormat on List<TimeOfDay> {
  /// Returns a list of formatted times - Example: [11:00, 16:30]
  List<String> get formatTime {
    List<String> times = [];
    this.forEach((element) => times.add(element.format(Get.context!)));
    return times;
  }
}

extension ParseDateTime on List<String> {
  /// Returns a list of `TimeOfDay` by parsing the given Times - Example: [TimeOfDay(hour: 11,minute:00)]
  List<TimeOfDay> get parseTime {
    List<TimeOfDay> times = [];
    this.forEach((element) {
      List<String> time = element.split(':');
      times
          .add(TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1])));
    });
    return times;
  }

  /// Returns a list of `DateTime` by parsing the given Dates
  List<DateTime> get parseDate {
    List<DateTime> dates = [];
    this.forEach((element) {
      dates.add(DateTime.parse(element));
    });
    return dates;
  }
}
