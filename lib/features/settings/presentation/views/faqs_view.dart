import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';

class FaqsView extends StatelessWidget {
  FaqsView({super.key});

  final List<FAQItem> faqItems = [
    FAQItem(
      question: "What is this app used for?",
      answer:
          "This app allows you to search for doctors, book appointments, and consult in person easily from your phone.",
    ),
    FAQItem(
      question: "Is the app free to use?",
      answer:
          "Yes, the app is free to use. Some doctors may charge for appointments.",
    ),
    FAQItem(
      question: "How can I find a doctor?",
      answer:
          "Use the search feature on the home screen to find doctors by specialty or location.",
    ),
    FAQItem(
      question: "Can I cancel my appointment?",
      answer:
          "Yes, you can cancel your appointment from your profile or upcoming appointments section.",
    ),
    FAQItem(
      question: "What payment are supported?",
      answer:
          "We support credit/debit cards, mobile wallets, and some local payment methods.",
    ),
    FAQItem(
      question: "How do I edit my profile?",
      answer: "Go to your profile tab and click 'Edit' to update your details.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "FAQs"),
          ListView(
            children: faqItems.map((item) {
              return ExpansionTile(
                title: Text(
                  item.question,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Text(item.answer),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
