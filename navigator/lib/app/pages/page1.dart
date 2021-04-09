import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/app/pages/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //if (!Navigator.canPop(context)) return Future.value(false);
        bool exit = false;

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Deseja Sair?'),
            actions: [
              ElevatedButton(
                child: Text('Sim'),
                onPressed: () {
                  exit = true;
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                  child: Text('Não'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        );

        print(exit);

        return exit;

        //return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Page 1'),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => Page2(),
                  //   ),
                  // );

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Page2(),
                    ),
                  );
                },
                child: Text('Vai para página 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ),
                  );
                },
                child: Text('Remove a 1 e Vai para página 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ),
                  );
                },
                child: Text('Remove (usando pop) a 1 e Vai para página 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
