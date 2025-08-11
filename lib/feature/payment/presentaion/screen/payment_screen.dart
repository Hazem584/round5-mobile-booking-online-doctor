import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/feature/doctor_details/presentaion/wedgits/price_section.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../../../doctor_details/presentaion/wedgits/doctor_header.dart';
import '../wedgits/payment_method_list.dart';
import '../wedgits/price_paybutton.dart';
import '../wedgits/state_row.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  static const String routeName = '/paymentScreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Book Appointment",
          style: AppTextStyles.black16w500.copyWith(
            fontSize: size.width < 360 ? 14 : 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorHeader(),
                  SizedBox(height: size.height * 0.04),
                  StateRow(),
                  SizedBox(height: size.height * 0.05),
                  PaymentMethodList(),
                ],
              ),
            ),
          ),
          PriceSection(),
          PriceAndPayButton(price: 350),
        ],
      ),
    );
  }
}
