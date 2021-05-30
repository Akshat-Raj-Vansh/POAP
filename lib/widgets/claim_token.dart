import 'package:flutter/material.dart';

class ClaimToken extends StatelessWidget {
  const ClaimToken({
    Key? key,
    required String imageUrl,
  })  : _imageUrl = imageUrl,
        super(key: key);

  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Event Name',
            style: TextStyle(fontSize: 30),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network(
              _imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Clain Token!'),
          ),
        ],
      ),
    );
  }
}
