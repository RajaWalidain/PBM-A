import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_uts_flutter_raja/main.dart';

void main() {
  testWidgets('MyApp has a title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Kegiatan Mahasiswa'), findsOneWidget);
  });
}
