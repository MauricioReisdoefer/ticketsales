import 'package:flutter_test/flutter_test.dart';
import 'package:ticketsales/core/models/event_model.dart';

void main() {
  group('EventModel Tests', () {
    test('Criar EventModel corretamente', () {
      final event = EventModel(id: 1, name: "Show", max_amount: 100);
      
      expect(event.id, 1);
      expect(event.name, "Show");
      expect(event.max_amount, 100);
    });

    test('Converter EventModel para Map', () {
      final event = EventModel(id: 1, name: "Show", max_amount: 100);
      final map = event.toMap();
      
      expect(map['id'], 1);
      expect(map['name'], "Show");
      expect(map['max_ammount'], 100);
    });

    test('Criar EventModel a partir de Map', () {
      final map = {
        'id': 2,
        'name': "Festa",
        'max_ammount': 200,
      };
      final event = EventModel.fromMap(map);
      
      expect(event.id, 2);
      expect(event.name, "Festa");
      expect(event.max_amount, 200);
    });

    test('EventModel sem id funciona', () {
      final event = EventModel(name: "Evento Sem ID", max_amount: 50);
      
      expect(event.id, null);
      expect(event.name, "Evento Sem ID");
      expect(event.max_amount, 50);
    });
  });
}
