import 'package:flutter/material.dart';

void main() {
  runApp(const GradebookApp());
}

class GradebookApp extends StatelessWidget {
  const GradebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libro de Calificaciones',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const GradebookHomePage(),
    );
  }
}

class GradebookHomePage extends StatelessWidget {
  const GradebookHomePage({super.key});

  // Lista de estudiantes y sus calificaciones
  final List<Map<String, dynamic>> students = const [
    {'name': 'Juan Pérez', 'grade': 85},
    {'name': 'Ana García', 'grade': 92},
    {'name': 'Luis Torres', 'grade': 74},
    {'name': 'María López', 'grade': 88},
    {'name': 'Carlos Rojas', 'grade': 67},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libro de Calificaciones'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
              //  child: Text(student['grade'].toString()),
                backgroundColor: student['grade'] >= 70 ? Colors.green : Colors.red,
                foregroundColor: Colors.white,
              ),
              title: Text(student['name']),
              subtitle: Text('Nota final: ${student['grade']}'),
              trailing: Icon(
                student['grade'] >= 70 ? Icons.check_circle : Icons.error,
                color: student['grade'] >= 70 ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
