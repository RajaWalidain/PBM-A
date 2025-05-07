// lib/pages/halaman_api.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HalamanApi extends StatefulWidget {
  const HalamanApi({Key? key}) : super(key: key);

  @override
  State<HalamanApi> createState() => _HalamanApiState();
}

class _HalamanApiState extends State<HalamanApi> {
  bool _isLoading = true;
  List<dynamic> _holidays = [];

  @override
  void initState() {
    super.initState();
    _fetchHolidays();
  }

  Future<void> _fetchHolidays() async {
    const url = 'https://date.nager.at/api/v3/PublicHolidays/2025/ID';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _holidays = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      // Error handling
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Hari Libur Nasional'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildDataTable(),
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Keterangan')),
          ],
          rows: _holidays
              .map(
                (holiday) => DataRow(
                  cells: [
                    DataCell(Text(holiday['date'] ?? '')),
                    DataCell(Text(holiday['localName'] ?? '')),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
