import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_auth_divider.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_social_media_container.dart';
import 'package:mobile_booking_online_doctor/features/home/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/validators/valiators.dart';
import '../../signup/view/widgets/signup_auth_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    // هنا هتستدعي API تسجيل الدخول
    // دي محاكاة للـ response بتاع Postman اللي انت بعته
    await Future.delayed(const Duration(seconds: 2));

    final String token =
        "51|ndHY51Ap32STWs5hbfrtYm7ZB0Ea3GDaKWEojQAM4d2baeb9"; // من الـ API

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);

    setState(() => isLoading = false);

    if (mounted) {
      // Pass the token to ConfirmLocationScreen
      Navigator.of(context).pushReplacementNamed(
        HomeView.routeName,
        arguments: {'token': token},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.light,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: TextStyles.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: TextStyles.spaceBtwSections),
                  Center(
                    child: Image.asset(
                      Assets.splashHeart,
                      color: ColorsManger.primaryColor,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(height: TextStyles.spaceBtwItems),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      Assets.signInTitle,
                      style: TextStyle(fontSize: 32, fontFamily: "Georgia"),
                    ),
                  ),
                  const SizedBox(height: TextStyles.spaceBtwSections * 2),

                  // email
                  TextFormField(
                    controller: emailController,
                    validator: (value) =>
                    value!.isEmpty ? "Please enter your email" : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF5F6F7),
                      prefixIcon: Icon(Icons.email,
                          color: ColorsManger.darkGrey),
                      labelText: Assets.hintEmail,
                      labelStyle: TextStyle(color: ColorsManger.dark),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(TextStyles.borderRadiusLg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(TextStyles.borderRadiusLg),
                        borderSide:
                        const BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(TextStyles.borderRadiusLg),
                        borderSide:
                        const BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                    ),
                  ),
                  const SizedBox(height: TextStyles.spaceBetweenInputFields),

                  // password
                  TextFormField(
                    validator: (value) => Validators.validatePassword(value),
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF5F6F7),
                      prefixIcon: Icon(Icons.vpn_key,
                          color: ColorsManger.darkGrey),
                      labelText: Assets.hintPassword,
                      labelStyle: TextStyle(color: ColorsManger.dark),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(TextStyles.borderRadiusLg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(TextStyles.borderRadiusLg),
                        borderSide:
                        const BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(TextStyles.borderRadiusLg),
                        borderSide:
                        const BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                    ),
                  ),
                  const SizedBox(height: TextStyles.xs / 2),

                  // Forget password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed("/forget_password");
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: ColorsManger.darkGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: TextStyles.spaceBtwSections * 2),

                  // Sign in button
                  SignupAuthElevatedButton(
                    buttonTitle: "Sign in",
                    primaryButton: true,
                    onPressed: isLoading ? null : _login,
                  ),

                  const SizedBox(height: TextStyles.spaceBtwItems),

                  // Divider
                  SigninAuthDivider(),
                  const SizedBox(height: TextStyles.spaceBtwItems),

                  // Social media buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SigninSocialMediaContainer(image: Assets.facebookIcon),
                      const SizedBox(width: TextStyles.spaceBtwItems),
                      SigninSocialMediaContainer(image: Assets.googleIcon),
                      const SizedBox(width: TextStyles.spaceBtwItems),
                      SigninSocialMediaContainer(image: Assets.appleIcon),
                    ],
                  ),
                  const SizedBox(height: TextStyles.spaceBtwItems),

                  // Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: ColorsManger.darkGrey),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed('/signup'),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: ColorsManger.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
