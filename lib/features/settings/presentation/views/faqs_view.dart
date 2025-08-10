import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/widgets/faq_item.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/widgets/faq_item_tile.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  int? expandedIndex;

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: "FAQs"),
          Expanded(
            child: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                final item = faqItems[index];
                final isExpanded = expandedIndex == index;

                return FaqItemTile(
                  question: item.question,
                  answer: item.answer,
                  isExpanded: isExpanded,
                  onTap: () {
                    setState(() {
                      expandedIndex = isExpanded ? null : index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
