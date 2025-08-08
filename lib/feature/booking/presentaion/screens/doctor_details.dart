import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import '../wedgits/doctor_state.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            SizedBox(width: screenWidth * 0.12),
            const Center(child: Text("Doctor Details")),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/Frame 1000001055.png"),
                  ),
                  const SizedBox(width: 19),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dr. Jessica Turner",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text("Pulmonologist"),
                      Row(
                        children: const [
                          Icon(Icons.location_on, color: Colors.blueGrey),
                          Text(
                            "129, El-Nasr Street, New Cairo",
                            style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DoctorStat(title: "Patients", value: "500+", icon: Icons.person),
                  DoctorStat(title: "Experience", value: "10 yrs", icon: Icons.person),
                  DoctorStat(title: "Rating", value: "4.9", icon: Icons.star),
                  DoctorStat(title: "Reviews", value: "1870", icon: Icons.messenger),
                ],
              ),
              const SizedBox(height: 24),
              const Text("About Doctor", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                "Dr. Jessica is an experienced pulmonologist with over 10 years in helping patients...",
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Text("Review and Rating", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Icon(Icons.star, color: Colors.blue, size: 30),
                  Text("add review", style: TextStyle(fontSize: 15, color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text("4.5/5", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          children: const [
                            Icon(Icons.star, color: Colors.yellow, size: 25),
                            Icon(Icons.star, color: Colors.yellow, size: 25),
                            Icon(Icons.star, color: Colors.yellow, size: 25),
                            Icon(Icons.star, color: Colors.yellow, size: 25),
                            Icon(Icons.star, color: Colors.yellowAccent, size: 25),
                          ],
                        ),
                      ),
                      const Text("Review +1025", style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/image (7).png"),
                        ),
                        const SizedBox(width: 19),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Nabila Reyna", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("30 min ago", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(color: Colors.yellow),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 15),
                              Text("4.5"),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Excellent service! Dr. Jessica Turner was attentive and thorough. The clinic was clean, and the staff were friendly. Highly recommend for in-person care!",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text("Price", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("350\$", style: TextStyle(color: Colors.red, fontSize: 15)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.appointment);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Book Appointment", style: TextStyle(color: Colors.white, fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
