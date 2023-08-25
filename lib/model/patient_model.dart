class PatientModel {
  String? date;
  String? drName;
  String? id;
  String? name;
  String? phoneNo;
  int? fileNo;
  int? price;

  PatientModel({
    required this.date,
    required this.drName,
    required this.id,
    required this.name,
    required this.phoneNo,
    required this.price,
    required this.fileNo,
  });

  PatientModel.fromJson(Map<String, dynamic>? json) {
    date = json!['date'];
    drName = json['drName'];
    id = json['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    fileNo = json['fileNo'];
    price = json['price'];
  }
}
