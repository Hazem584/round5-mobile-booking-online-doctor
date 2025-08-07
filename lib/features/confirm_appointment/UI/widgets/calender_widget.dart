import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Calendar Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  // Handle previous month
                },
              ),
              Text(
                'July 2025',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  // Handle next month
                },
              ),
            ],
          ),

          SizedBox(height: 16),

          // Week days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map(
                  (day) => Container(
                    width: 35,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          SizedBox(height: 16),

          // Calendar days
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildCalendarDays() {
    List<Widget> weeks = [];
    List<int> daysInMonth = [
      29, 30, 31, 1, 2, 3, 4,
      5, 6, 7, 8, 9, 10, 11,
      12, 13, 14, 15, 16, 17, 18,
      19, 20, 21, 22, 23, 24, 25,
      26, 27, 28, 29, 30, 31, 1,
    ];

    for (int i = 0; i < daysInMonth.length; i += 7) {
      List<Widget> week = [];
      for (int j = 0; j < 7; j++) {
        if (i + j < daysInMonth.length) {
          int day = daysInMonth[i + j];
          bool isSelected = day == widget.selectedDate.day &&
              widget.selectedDate.month == 7; // Check if this day is selected
          bool isCurrentMonth = day <= 31 && i + j >= 3;

          week.add(
            GestureDetector(
              onTap: () {
                if (isCurrentMonth) {
                  widget.onDateSelected(DateTime(2025, 7, day));
                }
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue[600] : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? Colors.white
                          : isCurrentMonth
                              ? Colors.black87
                              : Colors.grey[400],
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
      weeks.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: week,
          ),
        ),
      );
    }

    return Column(children: weeks);
  }
}