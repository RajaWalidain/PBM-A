// lib/pages/halaman_profil.dart
import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({Key? key}) : super(key: key);

  // Data dummy, silakan sesuaikan dengan data aslinya
  final List<Map<String, String>> anggota = const [
    {
      'nama': 'Raja Walidain',
      'ttl': 'Tangerang, 2 Oct 2004',
      'alamat': 'Tangerang',
      'foto': 'assets/images/anggota1.jpg',
    },
    {
      'nama': 'Putri Juliani',
      'ttl': 'Jakarta, 17 Juli 2002',
      'alamat': 'Jakarta',
      'foto': 'assets/images/anggota2.jpg',
    },
    {
      'nama': 'Wina Windari Kusdarniza',
      'ttl': 'Jakarta, 17 Januari 2004',
      'alamat': 'Jakarta',
      'foto': 'assets/images/anggota3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Anggota Kelompok'),
      ),
      body: ListView.builder(
        itemCount: anggota.length,
        itemBuilder: (context, index) {
          final profile = anggota[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Foto profil dengan rounded corner
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      profile['foto']!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Info profil
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile['nama']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('TTL: ${profile['ttl']}'),
                        const SizedBox(height: 4),
                        Text('Alamat: ${profile['alamat']}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
