import 'package:flutter/material.dart';
import '../../../../core/shared_wedgits/bottom_navi_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../wedgits/booking_card.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});
 static const String routeName = '/bookingScreen';
  @override
  Widget build(BuildContext context) {
    final List<String> days = ['Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'];
    final List<String> dates = ['11', '12', '13', '14', '15', '16', '17', '18'];

    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking', style: AppTextStyles.black16w700),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) {
                bool selected = index == 2;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ChoiceChip(
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width / 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(days[index], style: AppTextStyles.black12w500),
                          Text(dates[index], style: AppTextStyles.black12w500),
                        ],
                      ),
                    ),
                    selected: selected,
                    onSelected: (_) {},
                    showCheckmark: false,
                    selectedColor: AppColors.primary,
                    labelStyle: selected ? AppTextStyles.white12w500 : AppTextStyles.black12w500,
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
        onTap: (index) {},
      ),
    );
  }
}
