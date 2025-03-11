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


  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              ),
              Divider(),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: "Ingrese su usuario"
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Ingrese su contraseña"
                ),
              ),
              ElevatedButton(onPressed: (){
                    validarTextos();
                  }, child: Text("Validar"))
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
  
  void validarTextos() {
    String usuario = userController.text;
    String password = passwordController.text;
    RegExp regex = RegExp(
    r'^(?=.[a-z])(?=.[A-Z])(?=.*[.!@/()]).{5,}$'
    );
    if(usuario.trim() == "" || password.trim() == ""){
      mostrarAlert("Error. Usuario o contraseña vacíos");
    }
    else if(!regex.hasMatch(password)){
      mostrarAlert("Error. Contraseña no cumple parametros");
    }
    else{
      mostrarAlert("Datos Válidos");
    }
  }
  
  void mostrarAlert(String texto) {

    AlertDialog dialog = AlertDialog(
      content: Text(texto),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok")),
      ]
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return dialog;
    });

  }

}