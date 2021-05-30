import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/claim_token.dart';

class DeAi extends StatefulWidget {
  @override
  _DeAiState createState() => _DeAiState();
}

class _DeAiState extends State<DeAi> {
  final _imageUrl = "https://picsum.photos/250?image=9";
  final _tokenUrl = "http://POAP.xyz/claim/g8by5z";
  final _eventUrl = "https://api.poap.xyz/events/id/2533";

  @override
  void initState() {
    //_getDetails();
    super.initState();
  }

  Future<String> _getDetails() async {
    return await http.get(Uri.parse(_eventUrl)).then(
      (result) {
        if (result.statusCode == 200) {
          print(result.body);
          return 'Success';
        }
        return 'Failure';
      },
    );
  }

  Future<String> _claimToken() async {
    return await http.get(Uri.parse(_tokenUrl)).then(
      (result) {
        if (result.statusCode == 200) {
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
        content: ClaimToken(imageUrl: _imageUrl),
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
