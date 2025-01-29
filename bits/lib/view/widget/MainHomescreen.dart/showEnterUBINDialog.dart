import 'package:flutter/material.dart';

void showEnterUBINDialog(BuildContext context, Function(String) onSubmitted) {
  TextEditingController _controller = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter UBIN'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Please enter the UBIN:'),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'UBIN',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                onSubmitted(_controller.text);  // Pass the entered value
                Navigator.of(context).pop();
              } else {
                // Handle empty input if necessary
              }
            },
          ),
        ],
      );
    },
  );
}
