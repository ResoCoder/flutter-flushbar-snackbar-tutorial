import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar')),
      body: Center(
        child: Column(
          children: <Widget>[
            Builder(builder: (context) {
              return RaisedButton(
                child: Text('Show Default'),
                onPressed: () => showDefaultSnackbar(context),
              );
            }),
            RaisedButton(
              child: Text('Show Simple Flushbar'),
              onPressed: () => showSimpleFlushbar(context),
            ),
            RaisedButton(
              child: Text('Show Info Flushbar'),
              onPressed: () => showInfoFlushbar(context),
            ),
            RaisedButton(
              child: Text('Show Flushbar via Helper'),
              onPressed: () => showInfoFlushbarHelper(context),
            ),
            RaisedButton(
              child: Text('Show Floating Styled Flushbar'),
              onPressed: () => showFloatingFlushbar(context),
            ),
          ],
        ),
      ),
    );
  }

  void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Hello from the default snackbar'),
        action: SnackBarAction(
          label: 'Click Me',
          onPressed: () {},
        ),
      ),
    );
  }

  void showSimpleFlushbar(BuildContext context) {
    Flushbar(
      // There is also a messageText property for when you want to
      // use a Text widget and not just a simple String
      message: 'Hello from a Flushbar',
      // Even the button can be styled to your heart's content
      mainButton: FlatButton(
        child: Text(
          'Click Me',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onPressed: () {},
      ),
      duration: Duration(seconds: 3),
      // Show it with a cascading operator
    )..show(context);
  }

  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'This action is prohibited',
      message: 'Lorem ipsum dolor sit amet',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showInfoFlushbarHelper(BuildContext context) {
    FlushbarHelper.createInformation(
      title: 'This action is prohibited',
      message: 'Lorem ipsum dolor sit amet',
    ).show(context);
  }

  void showFloatingFlushbar(BuildContext context) {
    Flushbar(
      aroundPadding: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: 'This is a floating Flushbar',
      message: 'Lorem ipsum dolor sit amet',
    )..show(context);
  }
}
