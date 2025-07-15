import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {
      'location': 'Kasoa',
      'status': 'Off',
      'time': 'July 13, 8:15 PM',
    },
    {
      'location': 'Kumasi',
      'status': 'Restored',
      'time': 'July 12, 11:00 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        return Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(
              report['status'] == 'Off' ? Icons.flash_off : Icons.flash_on,
              color: report['status'] == 'Off' ? Colors.red : Colors.green,
            ),
            title: Text('${report['location']} - ${report['status']}'),
            subtitle: Text(report['time']!),
          ),
        );
      },
    );
  }
}
