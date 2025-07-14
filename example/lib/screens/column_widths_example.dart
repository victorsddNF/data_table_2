import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

import '../data_sources.dart';

/// Example demonstrating how to set specific column widths in PaginatedDataTable2
class ColumnWidthsExample extends StatefulWidget {
  const ColumnWidthsExample({super.key});

  @override
  State<ColumnWidthsExample> createState() => _ColumnWidthsExampleState();
}

class _ColumnWidthsExampleState extends State<ColumnWidthsExample> {
  late DessertDataSource _dessertsDataSource;

  @override
  void initState() {
    super.initState();
    _dessertsDataSource = DessertDataSource(context);
  }

  @override
  void dispose() {
    _dessertsDataSource.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Widths Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PaginatedDataTable2 with Custom Column Widths',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example shows how to set specific widths for individual columns:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Column 0 (Desert): 150px'),
                  Text('• Column 1 (Calories): 100px'),
                  Text('• Column 2 (Fat): 80px'),
                  Text('• Column 3 (Carbs): 100px'),
                  Text('• Column 4 (Protein): 120px'),
                  Text('• Column 5 (Sodium): 120px'),
                  Text('• Column 6 (Calcium): 120px'),
                  Text('• Column 7 (Iron): 100px'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PaginatedDataTable2(
                header: const Text('Desserts with Custom Column Widths'),
                columns: const [
                  DataColumn(label: Text('Desert')),
                  DataColumn(label: Text('Calories'), numeric: true),
                  DataColumn(label: Text('Fat (g)'), numeric: true),
                  DataColumn(label: Text('Carbs (g)'), numeric: true),
                  DataColumn(label: Text('Protein (g)'), numeric: true),
                  DataColumn(label: Text('Sodium (mg)'), numeric: true),
                  DataColumn(label: Text('Calcium (%)'), numeric: true),
                  DataColumn(label: Text('Iron (%)'), numeric: true),
                ],
                source: _dessertsDataSource,
                rowsPerPage: 5,
                columnWidths: {
                  0: 150.0, // First column (Desert) - 150px
                  1: 100.0, // Second column (Calories) - 100px
                  2: 80.0,  // Third column (Fat) - 80px
                  3: 100.0, // Fourth column (Carbs) - 100px
                  4: 120.0, // Fifth column (Protein) - 120px
                  5: 120.0, // Sixth column (Sodium) - 120px
                  6: 120.0, // Seventh column (Calcium) - 120px
                  7: 100.0, // Eighth column (Iron) - 100px
                },
                // Additional styling
                wrapInCard: true,
                borderRadius: BorderRadius.circular(12),
                backgroundColor: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: TableBorder.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
                headingRowColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.blue[50];
                  }
                  return Colors.grey[100];
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 