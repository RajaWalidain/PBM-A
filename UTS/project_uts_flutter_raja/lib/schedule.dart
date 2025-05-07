import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Map<String, List<Map<String, String>>> jadwal = {
      'Senin': [
        {'matkul': 'Pemrograman Berbasis Mobile', 'sks': '3'},
        {'matkul': 'E-Business', 'sks': '3'},
      ],
      'Selasa': [
        {'matkul': 'Metodologi Penelitian', 'sks': '3'},
        {'matkul': 'Prak. Pemrograman Berbasis Mobile', 'sks': '1'},
      ],
      'Rabu': [
        {'matkul': 'Manajemen Proyek', 'sks': '3'},
      ],
      'Kamis': [
        {'matkul': 'Enterprise Software Engineering', 'sks': '3'},
      ],
      'Jumat': [
        {'matkul': 'Geoinformatika', 'sks': '2'},
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Kuliah'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: ListView(
        children: jadwal.entries.map((entry) {
          final hari = entry.key;
          final matkulList = entry.value;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hari,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: matkulList.map((matkul) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(matkul['matkul']!),
                        trailing: Text('${matkul['sks']} SKS'),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}