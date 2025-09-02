class EventModel {
  int? id;
  String name;
  int max_amount;

  EventModel({
    this.id,
    required this.name,
    required this.max_amount,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      name: map['name'],
      max_amount: map['max_ammount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'max_ammount': max_amount,
    };
  }
}
