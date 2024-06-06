// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/models/contact.dart';

class EditScreen extends StatelessWidget {
  final Contact contact;
  const EditScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Center(
        child: Text('Edit Screen'),
      ),
    );
  }
}
