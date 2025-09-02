class SaleModel {
  int? id;
  String name;
  int amount;
  String date;
  int event_id;

  SaleModel({
    this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.event_id,
  });

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id'],
      name: map['name'],
      amount: map['ammount'],
      date: map['date'],
      event_id: map['event_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ammount': amount,
      'date': date,
      'event_id': event_id,
    };
  }
}
