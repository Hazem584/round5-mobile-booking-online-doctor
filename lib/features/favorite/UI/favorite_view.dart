import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static const String routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const FavoriteViewBody());
  }
}
