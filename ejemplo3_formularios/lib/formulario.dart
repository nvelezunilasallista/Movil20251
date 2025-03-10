import 'package:flutter/material.dart';

class Formulario extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Formulario();
  }
}

class _Formulario extends State<Formulario>{
  TextEditingController inputController = TextEditingController();
  List<Widget> valoresIngresadosPorUsuario = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Prueba Formulario")),
      body: ListView(
        children: [
          Column(
            children: [
              TextField(
                controller: inputController,
                decoration: InputDecoration(
                  hintText: "Ingrese un texto",
                  helperText: "El texto digitado será mostrado más abajo",
                  helperStyle: TextStyle(fontSize: 14.0)
                ),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                    agregarPalabra();
                  }, child: Text("Agregar")),
                  VerticalDivider(),
                  ElevatedButton(
                    onPressed: valoresIngresadosPorUsuario.isNotEmpty ?
                    (){mostrarAlertEliminacion();}
                    : null,
                    child: Text("Eliminar"),
                  )

                ],
              ),
              Column(
                children: valoresIngresadosPorUsuario,
              )
            ],
          )
        ],
      )
    );
  }

  void agregarPalabra(){
    String valorIngresado = inputController.text;
    setState(() {
      Widget textoIngresado = Text(valorIngresado);
      valoresIngresadosPorUsuario.add(textoIngresado);
      inputController.text="";
    });
  }

  void eliminarPalabra(){
    if(valoresIngresadosPorUsuario.isNotEmpty){
      setState(() {
        valoresIngresadosPorUsuario.removeLast();
      });
    }
  }

  void mostrarAlertEliminacion(){
    AlertDialog dialog = AlertDialog(
      content: Text("¿Está seguro que desea eliminar?"),
      actions: [
        TextButton(onPressed: (){eliminarPalabra(); Navigator.pop(context);}, child: Text("Sí")),
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("No")),
      ]
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return dialog;
    });
  }

}