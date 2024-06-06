import 'package:Contact_Plus/blocs/create/cubit/post_contact_cubit.dart';
import 'package:Contact_Plus/data/models/contact.dart';
import 'package:Contact_Plus/module.dart';
import 'package:date_cupertino_bottom_sheet_picker/date_cupertino_bottom_sheet_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:getwidget/getwidget.dart';

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

  List<String> items = [
    'Ayeyarwady Region',
    'Bago Region',
    'Chin State',
    'Kachin State',
    'Kayin State',
    'Kayah State',
    'Magway Region',
    'Mandalay Region',
    'Mon State',
    'Rakhine State',
    'Sagaing Region',
    'Shan State',
    'Tanintharyi Region',
    'Yangon Region',
  ];
  String selectedItem = 'Yangon Region';
  String? dropdown;

  List<String> genderList = ['Male', 'Female', 'Other'];
  String genderSelectedItem = 'Male';

  DateTime? selectedDate = DateTime(2012, 6, 7);
  String? dateBirth;

  @override
  Widget build(BuildContext context) {
    _dateOfBirth = selectedDate.toString();
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(9),
        children: [
          // First Name
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'John',
                labelText: 'First Name:'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter First Name';
              } else if (value.length < 3) {
                return 'Too short';
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
                hintText: 'Smit',
                labelText: 'Last Name:'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Last Name';
              } else if (value.length < 3) {
                return 'Too short';
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
                hintText: 'blabla',
                labelText: 'Nick Name:'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Nick Name';
              } else if (value.length < 5) {
                return 'Too short';
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

          // Phone
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '09*********',
                labelText: 'Phone:'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Phone';
              } else if (value.length < 9) {
                return 'Please enter valid phone number';
              } else if (value.substring(0, 2) != '09') {
                return 'Phone number in Myanmar start with 09';
              } else if (value.length > 11) {
                return 'Please check your number again! ';
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
                hintText: 'username@domain.com',
                labelText: 'Email:'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Email';
              } else if (!GetUtils.isEmail(value)) {
                return 'Please enter valid email';
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

          // DOB Picker
          const SizedBox(
            height: 9,
          ),

          // ------------- start
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: DateCupertinoBottomSheetPicker(
                width: 1.0, // Changed width 0 to 1.0
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                selectedDate: selectedDate,
                labelText: 'Date of birth...',
                labelTaxtColor: Colors.black,
                hintColor: Colors.black,
                iconColor: Colors.black,
                minAge: 12,
                height: 19,
                paddingVertical: 0,
                borderRadius: 8.0,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                borderColor: Colors.black,
                focusedBorderColor: Colors.black,
                enabledBorderColor: Colors.black,
                onChanged: (dateTime) {
                  selectedDate = dateTime;
                  dateBirth = dateTime.toString();
                  var onlyDate = dateBirth!.substring(0, 10);
                  setState(() {
                    _dateOfBirth = onlyDate;
                  });

                  debugPrint("Date of birth: $onlyDate");
                },
              ),
            ),
          ),
          // ------------- end

          // Gender
          // ----------- start
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gender: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                borderRadius: BorderRadius.circular(10),
                hint: Text("Gender: "),
                style: TextStyle(
                  color: GFColors.DARK,
                ),
                value: genderSelectedItem,
                onChanged: (newValue) {
                  setState(() {
                    genderSelectedItem = newValue ?? '';
                  });
                  _gender = genderSelectedItem.toString();
                },
                items: genderList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          // ----------- end

          // Address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Address: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                borderRadius: BorderRadius.circular(10),
                hint: Text("Address: "),
                style: TextStyle(
                  color: GFColors.DARK,
                ),
                value: selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue ?? '';
                  });
                  _address = selectedItem.toString();
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),

          // Summit Button
          GFButton(
            color: GFColors.ALT,
            textColor: Colors.white,
            shape: GFButtonShape.pills,
            icon: Icon(
              Icons.add,
              size: 19,
              color: Colors.white,
            ),
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
            child: const Text('Add Contact'),
          ),
        ],
      ),
    );
  }
}
