import 'dart:convert';
import 'package:ejemplo8_fullsync/contactModel.dart';
import 'package:http/http.dart' as http;

class ContactProviderAPI{

    Future<String> crearContacto(ContactModel contact) async{
        try{
          var url = Uri.parse("https://gg7wmjqgloqbcbkawj7t6ypvhu0oorgw.lambda-url.us-east-1.on.aws");

          var datos = {
                        'nombre' : contact.nombre,
                        'apellidos' : contact.apellidos,
                        'telefono' : contact.telefono,
                        'correo' :contact.email
                    };
          final cuerpoJSON = jsonEncode(datos);

          var response = await http.post(url,  headers: {'Content-Type': 'application/json'}, body:cuerpoJSON);

            String rawResponse = utf8.decode(response.bodyBytes);
            return rawResponse;
        }
        catch(ex){
            String msg = ex.toString();
            return msg;
        }
    }
}