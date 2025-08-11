import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class PriceAndPayButton extends StatelessWidget {
  final double price;

  const PriceAndPayButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 360;

    return
             Padding(
               padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
               child: SizedBox(width: double.infinity,
                 height: isSmall ? 36 : 44,
                 child: ElevatedButton(

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmall ? 12 : 14,
                    ),
                  )

                     ),
               ),
             );
  }
}
