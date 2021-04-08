import 'package:flutter/material.dart';
import 'package:navigator/app/pages/page3.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 2'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page3(),
                  ),
                );
              },
              child: Text('Vai para página 3'),
            )
          ],
        ),
      ),
    );
  }
}
