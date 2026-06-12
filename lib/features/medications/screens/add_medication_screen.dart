import 'package:flutter/material.dart';
import '../model/medication_model.dart';
import '../services/medication_service.dart';
import './medication_screen.dart';

class  AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => 
      _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final nameController = TextEditingController();
  final dosageController = TextEditingController();
  final timeController = TextEditingController();
  final frequencyController = TextEditingController();

  final service = MedicationService();

  Future<void> saveMedication() async {
    final medicationName = nameController.text.trim();
    final dosage = dosageController.text.trim();
    final time = timeController.text.trim();
    final frequency = frequencyController.text.trim();

    if (medicationName.isEmpty || dosage.isEmpty || time.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all required fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final med = Medication(
      id: '',
      name: medicationName,
      dosage: dosage,
      time: time,
      frequency: frequency,
    );

    try {
      await service.addMedication(med);

      if (!mounted) return;

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$medicationName added successfully"),
          backgroundColor: const Color(0xFF0D9488),
        ),
      );

      // Small delay so user sees message
      await Future.delayed(const Duration(milliseconds: 300));

      // Return to Medications screen
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to add medication"),
          backgroundColor: Colors.red,
        ),
      );
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medication'),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              label: Center(
                child: Text(
                  "Medication Name",
                  textAlign: TextAlign.center,
                ),
              )
            ),
          ),

          TextField(
            controller: dosageController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              label: Center(
                child: Text(
                  "Dosage",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          TextField(
            controller: timeController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              label: Center(
                child: Text(
                  "Time (e.g 08:00)",
                  textAlign: TextAlign.center,
                ),
              )
            ),
          ),

          TextField(
            controller: frequencyController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              label: Center(
                child: Text(
                  "Frequency (e.g daily)",
                  textAlign: TextAlign.center,
                ),
              )
            ),
          ),

          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D9488),
              ),
              onPressed: saveMedication,
              child: const Text("Save Medication"),
            ),
          )
        ],))
    );
  }
}
