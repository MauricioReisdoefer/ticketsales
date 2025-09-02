import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nome
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Quantidade
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantidade Máxima",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                // 
                // TO-DO: Connect to local db
                // 
              },
              child: const Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}
