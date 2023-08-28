class ExpensesModel {
  String? details;
  String? price;
  String? date;

  ExpensesModel({
    required this.details,
    required this.price,
    required this.date,
  });

  ExpensesModel.fromJson(Map<String, dynamic>? json) {
    details = json!['details'];
    price = json['price'];
    date = json['date'];
  }
}
