import 'package:flutter/material.dart';
import '../../../../core/utils/app_style.dart';

class PaymentOptionTile extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String iconPath;

  const PaymentOptionTile({
    super.key,
    required this.isSelected,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Icon(
          isSelected ? Icons.check_circle : Icons.circle_outlined,
          color: isSelected ? Colors.green : Colors.grey,
        ),
        title: Text(
          label,
          style: AppTextStyles.black14w500.copyWith(
            color: isSelected ? Colors.green : Colors.black,
          ),
        ),
        trailing: Image.asset(
          iconPath,
          height: size.height * 0.026,
        ),
      ),
    );
  }
}
