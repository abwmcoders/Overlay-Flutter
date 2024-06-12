import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Positioned(
              left: _offset.dx,
              top: _offset.dy,
              child: GestureDetector(
                onPanUpdate: (d) =>
                    setState(() => _offset += Offset(d.delta.dx, d.delta.dy)),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.black,
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage())),
          child: Text('Page2'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: FlutterLogo(size: 300),
    );
  }
}
