import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMultilengua extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _AppMultilengua();
  }
}

class _AppMultilengua extends State<AppMultilengua>{

  String idiomaPorDefecto = 'es';

  final Map<String, Map<String, String>>  textosApp = {
    'es' : {
      'saludo' : 'Hola',
      'pregunta': '¿Cómo estás?'
    },
    'en' : {
      'saludo' : 'Hello',
      'pregunta': 'How are you?'
    }
  };

  @override
  void initState(){
    super.initState();
    cargarIdioma();
  }

  Future<void> cargarIdioma() async {
    SharedPreferences config = await SharedPreferences.getInstance();
    setState(() {
      idiomaPorDefecto = config.getString('idioma') ?? idiomaPorDefecto;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("App Multilenguaje")),
      body: Column(children: [
        DropdownButton(
          items: [
            DropdownMenuItem(
              value: 'es',
              child: Text("Español")),
            DropdownMenuItem(
              value: 'en',
              child: Text("English"))
          ],
          value : idiomaPorDefecto,
         onChanged: (String? nuevoValor){
          if(nuevoValor != null){
            cambiarIdioma(nuevoValor);
          }
         }
         ),
        Text(textosApp[idiomaPorDefecto]!['saludo']!,
        style: TextStyle(fontSize: 26),),
        Text(textosApp[idiomaPorDefecto]!['pregunta']!,
        style: TextStyle(fontSize: 26),)
      ],)
    );
  }
  
  Future<void> cambiarIdioma(String nuevoValor) async {
    SharedPreferences config = await SharedPreferences.getInstance();
    config.setString('idioma', nuevoValor);
    setState(() {
      idiomaPorDefecto = nuevoValor;
    });
  }

  
}