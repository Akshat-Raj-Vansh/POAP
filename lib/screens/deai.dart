// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/claim_token.dart';

class DeAi extends StatefulWidget {
  @override
  _DeAiState createState() => _DeAiState();
}

class _DeAiState extends State<DeAi> {
  final _eventUrl = "https://api.poap.xyz/events/id/2533";
  var eventDetails = {
    'id': 2533,
    'name': 'Event Name',
    'imageUrl': 'https://picsum.photos/250?image=9',
  };

  @override
  void initState() {
    _getDetails();
    super.initState();
  }

  Future<String> _getDetails() async {
    return await http.get(Uri.parse(_eventUrl)).then(
      (result) {
        if (result.statusCode == 200) {
          eventDetails['id'] = jsonDecode(result.body)['id'];
          eventDetails['name'] = jsonDecode(result.body)['name'];
          eventDetails['imageUrl'] = jsonDecode(result.body)['image_url'];
          return 'Success';
        }
        return 'Failure';
      },
    );
  }

  void _loadDialog() {
    showDialog<Null>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: ClaimToken(
            eventName: eventDetails['name'],
            imageUrl: eventDetails['imageUrl']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextButton(
      child: Center(
        child: Text('Click here'),
      ),
      onPressed: _loadDialog,
    ));
  }
}
