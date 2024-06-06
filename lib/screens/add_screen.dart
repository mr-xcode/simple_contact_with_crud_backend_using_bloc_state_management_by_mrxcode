import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/blocs/create/cubit/post_contact_cubit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/data/models/contact.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/module.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostContactCubit>(
      create: (context) => PostContactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Add Contact',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.deepPurple[400],
        ),
        body: BlocBuilder<PostContactCubit, PostContactState>(
            builder: (context, state) {
          if (state is PostContactInitial) {
            return ContactForm();
          } else if (state is PostContactLoading) {
            return Center(child: GFLoader());
          } else if (state is PostContactSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Success',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  GFButton(
                    onPressed: () {
                      Navigator.pop(context, 'success');
                    },
                    blockButton: true,
                    color: GFColors.SUCCESS,
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    shape: GFButtonShape.pills,
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    child: const Text(
                      'Go Home',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is PostContactFail) {
            return Center(child: Text(state.error));
          }
          return Container();
        }),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final formKey = GlobalKey<FormState>();
  late String _firstName,
      _lastName,
      _nickName,
      _dateOfBirth,
      _gender,
      _phone,
      _email,
      _address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(9),
        children: [
          // First Name
          TextFormField(
            decoration: const InputDecoration(
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
              _firstName = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Last Name
          TextFormField(
            decoration: const InputDecoration(
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
              _lastName = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Nick Name
          TextFormField(
            decoration: const InputDecoration(
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
              _nickName = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // DOB Picker
          TextFormField(
            decoration: const InputDecoration(
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
              _dateOfBirth = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Gender
          TextFormField(
            decoration: const InputDecoration(
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
              _gender = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Phone
          TextFormField(
            decoration: const InputDecoration(
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
              _phone = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Email
          TextFormField(
            decoration: const InputDecoration(
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
              _email = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Address
          TextFormField(
            decoration: const InputDecoration(
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
              _address = value ?? '';
            },
          ),
          const SizedBox(
            height: 9,
          ),

          // Summit Button
          GFButton(
            color: GFColors.ALT,
            textColor: Colors.white,
            shape: GFButtonShape.pills,
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Contact contact = Contact(
                    id: '',
                    firstName: _firstName,
                    lastName: _lastName,
                    nickName: _nickName,
                    dateOfBirth: _dateOfBirth,
                    gender: _gender,
                    phone: _phone,
                    email: _email,
                    address: _address);

                BlocProvider.of<PostContactCubit>(context).addContact(contact);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
