import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class OTPPhoneVerificationScreen extends StatefulWidget {
  const OTPPhoneVerificationScreen({super.key});


  @override
  State<OTPPhoneVerificationScreen> createState() => _OTPPhoneVerificationScreen();
}

class _OTPPhoneVerificationScreen extends State<OTPPhoneVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  int _secondsRemaining = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        title: const Text("Code Verification",
            style: TextStyle(color: Colors.black, fontFamily: "Georgia")),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppStyle.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppStyle.spaceBtwSections),
            const Text(
              "Code has been sent to +02 010 *** **88",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyle.spaceBtwSections),

            // OTP Input
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(AppStyle.borderRadiusMd),
                fieldHeight: 60,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeColor: Colors.grey.shade400,
                selectedColor: AppColors.primaryColor,
                inactiveColor: Colors.grey.shade400,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onChanged: (value) {},
            ),

            const SizedBox(height: AppStyle.spaceBtwItems),

            // Resend Timer
            _secondsRemaining > 0
                ? Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Resend code in ',
                    style: TextStyle(color: AppColors.darkGrey),
                  ),
                  TextSpan(
                    text: '$_secondsRemaining',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: ' s',
                    style: TextStyle(color: AppColors.darkGrey),
                  ),
                ],
              ),
            )
                : TextButton(
              onPressed: () {
                setState(() {
                  _secondsRemaining = 60;
                  startTimer();
                });
              },
              child: const Text("Resend Code",style: TextStyle(color: Colors.black),),
            ),

            const SizedBox(height: AppStyle.spaceBtwSections),

            // Verify Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/current_location");
                  // تحقق من الكود هنا
                  print("OTP Entered: ${otpController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: AppStyle.defaultSpace - 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.borderRadiusMd),
                  ),
                ),
                child: const Text("Verify", style: TextStyle(fontSize: 16,color: AppColors.light)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
