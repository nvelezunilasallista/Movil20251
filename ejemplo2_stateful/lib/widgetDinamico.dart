import 'package:flutter/material.dart';

class WidgetDinamico extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _WidgetDinamico();
  }
}

class _WidgetDinamico extends State<WidgetDinamico>{

  String textoAMostrar = "";
  List<String> fraseCompleta =
    ["Frase", "con", "varias", "palabras"];
  int indice = 0;

  _WidgetDinamico(){
    this.textoAMostrar = fraseCompleta[indice];
  }

  mostrarSiguientePalabra() {
    if(indice < 3){
      indice++;
    }
    else{
      indice=0;
    }
    setState(() {
      textoAMostrar = fraseCompleta[indice];
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo de Stateful Widget"),),
      body: Container(
        child: Column(
          children: [
            Text(this.textoAMostrar),
            ElevatedButton(
                onPressed: (){mostrarSiguientePalabra();},
                child: Text("Siguiente palabra"))
          ],
        )
      )
    );
  }

}