import 'package:flutter/material.dart';
import '../services/medication_service.dart';
import '../model/medication_model.dart';
import 'add_medication_screen.dart';

class MedicationsScreen extends StatelessWidget {
  MedicationsScreen({super.key});

  final service = MedicationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const Text("Medications"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0D9488),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddMedicationScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: StreamBuilder<List<Medication>>(
        stream: service.getMedications(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final meds = snapshot.data!;

          if (meds.isEmpty) {
            return const Center(
              child: Text(
                "No medications added yet",
                textAlign: TextAlign.center,
              ),
            );
          }

          return Center(
            child: SizedBox(
              width: 600,
              child: ListView.builder(
                itemCount: meds.length,
                itemBuilder: (context, index) {
                  final med = meds[index];

                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),

                      leading: const Icon(
                        Icons.medication,
                        color: Color(0xFF0D9488),
                      ),

                      title: Text(
                        med.name,
                        textAlign: TextAlign.center,
                      ),

                      subtitle: Text(
                        "${med.dosage} • ${med.frequency}",
                        textAlign: TextAlign.center,
                      ),

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          service.deleteMedication(med.id);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}