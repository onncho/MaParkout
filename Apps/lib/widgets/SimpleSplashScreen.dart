import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleSplashScreen extends StatelessWidget {
  final String _imageUrl;

  SimpleSplashScreen(this._imageUrl);

//'assets/ ma_repo/logo_on_white.jpeg'

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              flex: 8,
              child: CircleAvatar(
                child: Image.asset(_imageUrl),
                minRadius: 50,
                maxRadius: 100,
              )),
          Flexible(
            flex: 2,
            child: Text('מתי רואים אותך?',
                style: new TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
