import 'package:ejemplo8_fullsync/contactList.dart';
import 'package:ejemplo8_fullsync/createContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(routes:{
      "/": (BuildContext context) => ContactList(),
      "/createcontact": (BuildContext) => CreateContact()
    })
  );
}
