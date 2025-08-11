import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/confirm_appointment/UI/widgets/time_slots_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../home/view/widgets/doctor_card.dart';
import 'button_widget.dart';
import 'calender_widget.dart';
import 'date_dropdown.dart';

class ConfirmAppointmentViewBody extends StatefulWidget {
  const ConfirmAppointmentViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConfirmAppointmentViewBodyState createState() =>
      _ConfirmAppointmentViewBodyState();
}

class _ConfirmAppointmentViewBodyState
    extends State<ConfirmAppointmentViewBody> {
  DateTime selectedDate = DateTime(2025, 7, 21);
  String selectedTime = '';

  // Available time slots
  List<String> timeSlots = [
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Book Appointment', style: TextStyles.font18BlackNormal),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorCard(),
                  verticalSpace(24),
                  Text('Select a day', style: TextStyles.font18BlackNormal),
                  verticalSpace(14),
                  DateDropdown(),
                  verticalSpace(24),
                  CalendarWidget(
                    selectedDate: selectedDate,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        selectedDate = date;
                        selectedTime = '';
                      });
                    },
                  ),
                  verticalSpace(24),
                  ...[
                  Text(
                    'Select time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  verticalSpace(14),
                  TimeSlotsWidget(
                    selectedTime: selectedTime,
                    timeSlots: timeSlots,
                    onTimeSelected: (String time) {
                      setState(() {
                        selectedTime = time;
                      });
                    },
                  ),
                  verticalSpace(24),
                ],
                  verticalSpace(120),
                ],
              ),
            ),
          ),
          FixedBottomButton(
            price: '350\$',
            priceUnit: '/hour',
            buttonText: 'Continue to Pay',
            isEnabled: selectedTime.isNotEmpty,
            onPressed: selectedTime.isNotEmpty ? _showConfirmationDialog : null,
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Doctor: Dr. Jessica Turner'),
              Text(
                'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              ),
              Text('Time: $selectedTime'),
              Text('Price: 350\$/hour'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to payment screen
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        );
      },
    );
  }
}
