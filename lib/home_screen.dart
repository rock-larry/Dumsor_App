import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  void _showReportDialog(BuildContext context) {
    final TextEditingController _commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Report Power Outage'),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Add a comment (optional)',
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                String comment = _commentController.text;
                // TODO: Save report to Firebase
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Outage reported!')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dumsor Tracker',
            style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,

        centerTitle: true,
      ),
      backgroundColor: Colors.grey, // optional: change screen background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current Power Status: ⚡ ON',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () => _showReportDialog(context),
                icon: Icon(Icons.report_problem),
                label: Text('Report Power Outage'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
