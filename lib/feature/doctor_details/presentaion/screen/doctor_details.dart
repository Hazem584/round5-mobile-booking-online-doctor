import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_style.dart';
import '../wedgits/doc_state_row.dart';
import '../wedgits/doctor_header.dart';
import '../wedgits/price_section.dart';
import '../wedgits/review_card.dart';
import '../wedgits/review_header.dart';
import '../wedgits/review_summry.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(width: screenWidth * 0.12),
            Text("Doctor Details", style: AppTextStyles.black20w700),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorHeader(),
            const SizedBox(height: 24),
            DoctorStatsRow(),
            const SizedBox(height: 24),
            Text("About Doctor", style: AppTextStyles.black23w700),
            const SizedBox(height: 8),
            Text(
              "Dr. Jessica is an experienced pulmonologist with over 10 years in helping patients...",
              style: AppTextStyles.grey19w400,
            ),
            const SizedBox(height: 24),
            ReviewHeader(),
            const SizedBox(height: 15),
            ReviewSummary(),
            const SizedBox(height: 8),
            ReviewCard(),
            PriceSection(),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.appointment);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Book Appointment", style: AppTextStyles.white20w700),
            )
          ],
        ),
      ),
    );
  }
}
