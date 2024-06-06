// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/blocs/update/cubit/edit_contact_cubit.dart';

import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/models/contact.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/module.dart';

class EditScreen extends StatelessWidget {
  final Contact contact;
  const EditScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditContactCubit>(
      create: (context) => EditContactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit'),
        ),
        body: BlocBuilder<EditContactCubit, EditContactState>(
            builder: (context, state) {
          if (state is EditContactInitial) {
            print('state is initial');
            return ContactForm(
              contact: contact,
            );
          } else if (state is EditContactLoading) {
            print('state is Loading');
            return Center(child: GFLoader());
          } else if (state is EditContactSuccess) {
            print('state is success');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Success'),
                  GFButton(
                    onPressed: () {
                      Navigator.pop(context, 'success');
                    },
                    child: Text('Go Home'),
                  ),
                ],
              ),
            );
          } else if (state is EditContactFail) {
            print('state is fail');
            return Center(child: Text(state.error));
          }
          return Container();
        }),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final Contact contact;
  const ContactForm({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState(contact: contact);
}

class _ContactFormState extends State<ContactForm> {
  final formKey = GlobalKey<FormState>();
  final Contact contact;
  late String _firstName,
      _lastName,
      _nickName,
      _dateOfBirth,
      _gender,
      _phone,
      _email,
      _address;
  _ContactFormState({required this.contact});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.all(9),
        children: [
          // First Name
          TextFormField(
            initialValue: contact.firstName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'First Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter First Name';
              }
              return null;
            },
            onSaved: (value) {
              this._firstName = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // Last Name
          TextFormField(
            initialValue: contact.lastName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Last Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Last Name';
              }
              return null;
            },
            onSaved: (value) {
              this._lastName = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // Nick Name
          TextFormField(
            initialValue: contact.nickName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nick Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Nick Name';
              }
              return null;
            },
            onSaved: (value) {
              this._nickName = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // DOB Picker
          TextFormField(
            initialValue: contact.dateOfBirth,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Date Of Birth (30-12-2000)',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter DOB';
              }
              return null;
            },
            onSaved: (value) {
              this._dateOfBirth = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // Gender
          TextFormField(
            initialValue: contact.gender,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Gender (Male/ Female ?)',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Gender';
              }
              return null;
            },
            onSaved: (value) {
              this._gender = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // Phone
          TextFormField(
            initialValue: contact.phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Phone',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Phone';
              }
              return null;
            },
            onSaved: (value) {
              this._phone = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // Email
          TextFormField(
            initialValue: contact.email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Email';
              }
              return null;
            },
            onSaved: (value) {
              this._email = value ?? '';
            },
          ),
          SizedBox(
            height: 9,
          ),

          // Address
          TextFormField(
            initialValue: contact.address,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Address',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onSaved: (value) {
              this._address = value ?? '';
            },
          ),

          SizedBox(
            height: 9,
          ),
          GFButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                String id = contact.id;
                Contact _contact = Contact(
                    id: id,
                    firstName: _firstName,
                    lastName: _lastName,
                    nickName: _nickName,
                    dateOfBirth: _dateOfBirth,
                    gender: _gender,
                    phone: _phone,
                    email: _email,
                    address: _address);
                BlocProvider.of<EditContactCubit>(context)
                    .editContact(id, _contact);
              }
            },
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }
}
