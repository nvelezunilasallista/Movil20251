import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (isFirstRun) {
      // Si es la primera vez, mostrar los slides de bienvenida
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeSlides()),
      );
    } else {
      // Si no es la primera vez, ir directamente al home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class WelcomeSlides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          SlidePage(
            color: Colors.red,
            text: 'Bienvenido a la App!',
          ),
          SlidePage(
            color: Colors.blue,
            text: 'Disfruta de la experiencia!',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isFirstRun', false);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class SlidePage extends StatelessWidget {
  final Color color;
  final String text;

  SlidePage({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Bienvenido al Home!'),
      ),
    );
  }
}
