import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

import '../../../../core/shared_wedgits/bottom_navi_bar.dart';
import '../wedgits/booking_card.dart';


class MyBookingPage extends StatelessWidget {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> days = ['Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue 16', 'Wed', 'Thu'];
    final List<String> data = ['11', '12', '13', '14', '15', '16', '17', '18'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Booking'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) {
                bool selected = index == 2;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ChoiceChip(
                    label: Container(
                      width: MediaQuery.of(context).size.width / 9,
                      height: 40,
                      alignment: Alignment.center,
                      child: Column(children: [
                        Text(days[index],style: TextStyle(fontSize: 13),),
                        Text(data[index],style: TextStyle(fontSize: 13),),
                      ],),
                      // child: Text(days[index]),
                    ),
                    selected: selected,
                    onSelected: (_) {},
                    showCheckmark: false,
                    selectedColor:AppColors.primary,
                    labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
                    backgroundColor: Colors.grey[200],
                  ),
                );

              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: const [
                BookingCard(status: 'Upcoming'),
                BookingCard(status: 'Completed'),
                BookingCard(status: 'Canceled'),
                BookingCard(status: 'Completed'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          // Navigate to pages
        },
      ),

    );
  }
}
