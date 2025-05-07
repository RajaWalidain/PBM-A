import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _kegiatan = [
    {'nama': 'Belajar Flutter', 'tanggal': 'Senin', 'selesai': false},
    {'nama': 'Kerjakan Tugas', 'tanggal': 'Selasa', 'selesai': false},
  ];

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'Selamat Pagi';
    if (hour < 15) return 'Selamat Siang';
    if (hour < 18) return 'Selamat malam';
    return 'Selamat malam';
  }

  String getBackgroundImage() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'assets/images/morning.jpg';
    if (hour < 15) return 'assets/images/afternoon.jpg';
    if (hour < 18) return 'assets/images/night.jpg';
    return 'assets/images/morning.jpg';
  }

  void _tambahAtauEditKegiatan({Map<String, dynamic>? kegiatan, int? index}) {
    String nama = kegiatan?['nama'] ?? '';
    String tanggal = kegiatan?['tanggal'] ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Tambah Kegiatan' : 'Edit Kegiatan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nama Kegiatan'),
                controller: TextEditingController(text: nama),
                onChanged: (value) => nama = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Hari'),
                controller: TextEditingController(text: tanggal),
                onChanged: (value) => tanggal = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () {
                if (nama.isNotEmpty && tanggal.isNotEmpty) {
                  setState(() {
                    if (index == null) {
                      _kegiatan.add({
                        'nama': nama,
                        'tanggal': tanggal,
                        'selesai': false,
                      });
                    } else {
                      _kegiatan[index] = {
                        ..._kegiatan[index],
                        'nama': nama,
                        'tanggal': tanggal,
                      };
                    }
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _hapusKegiatan(int index) {
    setState(() {
      _kegiatan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final greeting = getGreeting();
    final wallpaper = getBackgroundImage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kegiatan Mahasiswa'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(wallpaper),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              greeting,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ..._kegiatan.asMap().entries.map((entry) {
              int index = entry.key;
              var kegiatan = entry.value;
              return Dismissible(
                key: Key(kegiatan['nama'] + index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) => _hapusKegiatan(index),
                child: Card(
                  color: Colors.white.withOpacity(0.9),
                  child: InkWell(
                    onLongPress: () => _tambahAtauEditKegiatan(
                      kegiatan: kegiatan,
                      index: index,
                    ),
                    child: CheckboxListTile(
                      title: Text(kegiatan['nama']),
                      subtitle: Text(kegiatan['tanggal']),
                      value: kegiatan['selesai'],
                      onChanged: (value) {
                        setState(() {
                          _kegiatan[index]['selesai'] = value;
                        });
                      },
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tambahAtauEditKegiatan(),
        tooltip: 'Tambah Kegiatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
