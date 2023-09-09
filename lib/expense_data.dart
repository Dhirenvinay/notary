
class Expense {
  final String expenseName;
  final String description;
  final String? vendorName;
  final String? notes;
  final double cost;
  final String category;
  final String internalKeyForKnownExpenses;
  final String serviceId;

  Expense({
    required this.expenseName,
    required this.description,
    this.vendorName,
    this.notes,
    required this.cost,
    required this.category,
    required this.internalKeyForKnownExpenses,
    required this.serviceId,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      expenseName: json['expenseName'],
      description: json['description'],
      vendorName: json['vendorName'],
      notes: json['notes'],
      cost: json['cost'].toDouble(),
      category: json['category'],
      internalKeyForKnownExpenses: json['internalKeyForKnownExpenses'],
      serviceId: json['serviceId'],
    );
  }
}
