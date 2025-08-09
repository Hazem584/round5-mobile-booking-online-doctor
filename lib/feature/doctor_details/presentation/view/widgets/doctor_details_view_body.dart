import 'package:flutter/material.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor details'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Doctor'),
      ),
    );
  }
}
