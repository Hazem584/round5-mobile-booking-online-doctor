import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/drop_down_arrow.dart';

class BirthdayInputWidget extends StatefulWidget {
  final String initialDay;
  final String initialMonth;
  final String initialYear;
  final Function(String day, String month, String year) onDateChanged;

  const BirthdayInputWidget({
    super.key,
    this.initialDay = '1',
    this.initialMonth = 'January',
    this.initialYear = '2000',
    required this.onDateChanged,
  });

  @override
  _BirthdayInputWidgetState createState() => _BirthdayInputWidgetState();
}

class _BirthdayInputWidgetState extends State<BirthdayInputWidget> {
  late String selectedDay;
  late String selectedMonth;
  late String selectedYear;

  final List<String> days = List.generate(
    31,
    (index) => (index + 1).toString(),
  );

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<String> years = List.generate(
    80,
    (index) => (2024 - index).toString(),
  );

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDay;
    selectedMonth = widget.initialMonth;
    selectedYear = widget.initialYear;
  }

  void _onDateChanged() {
    widget.onDateChanged(selectedDay, selectedMonth, selectedYear);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select your birthday', style: TextStyles.font16LightBlackNormal),
        verticalSpace(16),
        Row(
          children: [
            Expanded(
              child: DropDownArrow(
                value: selectedDay,
                items: days,
                onChanged: (value) {
                  setState(() => selectedDay = value!);
                  _onDateChanged();
                },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: DropDownArrow(
                value: selectedMonth,
                items: months,
                onChanged: (value) {
                  setState(() => selectedMonth = value!);
                  _onDateChanged();
                },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: DropDownArrow(
                value: selectedYear,
                items: years,
                onChanged: (value) {
                  setState(() => selectedYear = value!);
                  _onDateChanged();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
