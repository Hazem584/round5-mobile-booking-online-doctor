import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../otp/logic/cubit/otp_cubit.dart';
import '../../otp/logic/cubit/otp_state.dart';

class OTPEmailVerificationScreen extends StatefulWidget {
  final String email;
  final String token;

  const OTPEmailVerificationScreen({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  State<OTPEmailVerificationScreen> createState() =>
      _OTPEmailVerificationScreenState();
}

class _OTPEmailVerificationScreenState extends State<OTPEmailVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  int _secondsRemaining = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
      backgroundColor: ColorsManger.light,
      appBar: AppBar(
        title: const Text(
          "Code Verification",
          style: TextStyle(color: Colors.black, fontFamily: "Georgia"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TextStyles.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: TextStyles.spaceBtwSections),
            const Text(
              "Code has been sent to your email",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TextStyles.sm),
            const Text(
              "Check your Email",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TextStyles.spaceBtwSections * 2),

            // OTP Input
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(TextStyles.borderRadiusMd),
                fieldHeight: 60,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeColor: Colors.grey.shade400,
                selectedColor: ColorsManger.primaryColor,
                inactiveColor: Colors.grey.shade400,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: TextStyles.spaceBtwItems),

            // Resend Timer
            _secondsRemaining > 0
                ? Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Resend code in ',
                    style: TextStyle(color: ColorsManger.darkGrey),
                  ),
                  TextSpan(
                    text: '$_secondsRemaining',
                    style: TextStyle(
                      color: ColorsManger.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: ' s',
                    style: TextStyle(color: ColorsManger.darkGrey),
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
                // هنا ممكن تستدعي API إعادة الإرسال
              },
              child: const Text(
                "Resend Code",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: TextStyles.spaceBtwSections),

            // BlocConsumer + Verify Button
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  Navigator.pushNamed(context, '/reset_password');
                } else if (state is OtpError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is OtpLoading) {
                  return const CircularProgressIndicator();
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<OtpCubit>().verifyOtp(
                        widget.email,
                        otpController.text.trim(),
                        widget.token,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManger.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: TextStyles.defaultSpace - 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          TextStyles.borderRadiusMd,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 16, color: ColorsManger.light),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
