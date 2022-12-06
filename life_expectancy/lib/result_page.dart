import 'package:flutter/material.dart';
import 'package:life_expectancy/user_data.dart';

import 'constants.dart';
import 'user_data.dart';
import 'hesap.dart';
class ResultPage extends StatelessWidget {

   final UserData _userData;
   ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(

          'Sonuç Sayfası',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Hesap(_userData).hesaplama().round().toString(),
                style: kMetinStili,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle: kMetinStili,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('GERİ DÖN'),
            ),
          ),
        ],
      ),
    );
  }
}
