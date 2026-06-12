class Medication{
  final String id;
  final String name;
  final String dosage;
  final String time;
  final String frequency;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.time,
    required this.frequency,
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'time': time,
      'frequency': frequency,
    };
  }

  factory Medication.fromMap(Map<String, dynamic> map, String docId){
    return Medication(
      id: docId, 
      name: map['name'] ?? '', 
      dosage: map['dosage'] ?? '', 
      time: map['time'] ?? '', 
      frequency: map['frequency'] ?? '',
    ); 
  }
}