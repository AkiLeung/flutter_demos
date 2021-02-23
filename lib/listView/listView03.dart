import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListView03 extends StatefulWidget {
  @override
  _ListView03State createState() => _ListView03State();
}

class _ListView03State extends State<ListView03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            null,
            // RaisedButton(
            //   child: const Text('List Card Test'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => CardListScreen()),
            //     );
            //   },
            // ),
            // RaisedButton(
            //   child: const Text('Grid Card Test'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => CardGridScreen()),
            //     );
            //   },
            // ),
            // RaisedButton(
            //   child: const Text('Column Card Test'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => CardColumnScreen()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
