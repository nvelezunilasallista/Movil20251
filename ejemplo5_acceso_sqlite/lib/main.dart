import 'package:ejemplo5_acceso_sqlite/contactList.dart';
import 'package:ejemplo5_acceso_sqlite/createContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(routes:{
      "/": (BuildContext context) => ContactList(),
      "/createcontact": (BuildContext) => CreateContact()
    })
  );
}
