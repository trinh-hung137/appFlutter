import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  var formatDate = DateFormat('dd/MM/yyyy HH:mm');
  Future<String> showDatePickerView(
      String thoiGian, BuildContext context) async {
    final datetime = await pickDateTime(thoiGian, context);
    return formatDate.format(datetime!);
  }

  Future<DateTime?> pickDateTime(String thoiGian, BuildContext context) async {
    final date = await pickDate(thoiGian, context);

    if (date != null) {
      final time = await pickTime(thoiGian, context);

      return DateTime(
        date.year,
        date.month,
        date.day,
        time!.hour,
        time.minute,
      );
    }
  }

  Future<DateTime?> pickDate(String thoiGian, BuildContext context) async {
    DateTime date;
    if (thoiGian.isEmpty) {
      date = DateTime.now();
    } else {
      date = formatDate.parse(thoiGian);
    }
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(String thoiGian, BuildContext context) async {
    DateTime? date;
    if (thoiGian.isNotEmpty) {
      date = formatDate.parse(thoiGian);
    }
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: date != null
          ? TimeOfDay(hour: date.hour, minute: date.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }

  bool validateMobile(String value) {
    String patttern = r'(^0[0-9]{9}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }
}
