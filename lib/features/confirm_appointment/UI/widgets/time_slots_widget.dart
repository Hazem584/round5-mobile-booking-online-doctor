import 'package:flutter/material.dart';

class TimeSlotsWidget extends StatelessWidget {
  final String selectedTime;
  final Function(String) onTimeSelected;
  final List<String> timeSlots;

  const TimeSlotsWidget({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
    required this.timeSlots,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        String time = timeSlots[index];
        bool isSelected = selectedTime == time;
    
        return GestureDetector(
          onTap: () {
            onTimeSelected(time);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue[600] : Colors.white,
              border: Border.all(
                color: isSelected ? Colors.blue[600]! : Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}