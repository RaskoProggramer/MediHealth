import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Good Morning 👋",
                  style: TextStyle( fontSize: 18, color: Colors.grey
                  ),
    ),
              const SizedBox(height: 5),
              const Text("Mpho",
                  style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 15),
              const Text("Quick Actions",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.5,
                children: const [
                  QuickActionCard(
                    icon: Icons.calendar_month_outlined,
                    title: 'Appointments',
                  ),
                  QuickActionCard(
                    icon: Icons.medication_outlined,
                    title: 'Medications',
                  ),
                  QuickActionCard(
                    icon: Icons.insert_drive_file_outlined,
                    title: 'Records',
                  ),
                  QuickActionCard(
                    icon: Icons.person_outline,
                    title: 'Emergency',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text("Upcoming Appointments",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Smith",
                    style: TextStyle( color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    ),
                    ),

                    SizedBox(height: 8),
                    Text("Tomorrow, 10:00 AM",
                    style: TextStyle(color: Colors.white70,
                    fontSize: 16,
                    ),
                    ),
                  ],
                  ),
              ),

              const SizedBox(height: 30),

              const Text("Todays Medications",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              
               const SizedBox(height: 15),
              const MedicationTile(
                medication: "Aspirin",
                time: "8:00 AM",
              ),
              const SizedBox(height: 10),
              const MedicationTile(
                medication: "Metformin",
                time: "12:00 PM",
              ),

              const SizedBox(height: 30),
              const Text("Health Tips",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Remember to drink at least 2 litres of water today."),
              ),
            ],
            ),
        ),
        ),
      );
  }
}

class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickActionCard({super.key,
  required this.icon,
  required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color(0xFF0D9488),
          ),
          const SizedBox(height: 10),
          Text(title),
        ],
          ),
      );
  }
}

class MedicationTile extends StatelessWidget {
  final String medication;
  final String time;

  const MedicationTile({
    super.key,
    required this.medication,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.medication, 
          color: const Color(0xFF0D9488)),
        title: Text(medication),
        subtitle: Text(time),
      ),
    );
  }
}