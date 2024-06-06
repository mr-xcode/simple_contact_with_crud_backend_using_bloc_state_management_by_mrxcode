// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/data/models/contact.dart';

class DetailedScreen extends StatelessWidget {
  final Contact contact;
  const DetailedScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_rounded),
          ),
          SizedBox(
            width: 9,
          ),
        ],
        title: Text(
          '${contact.firstName} ${contact.lastName}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Container(
        child: Column(
          children: [
            // Name
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name: '),
                    Text('${contact.firstName}  ${contact.lastName}'),
                  ],
                ),
              ),
            ),

            // Nick Name
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nick Name: '),
                    Text('${contact.nickName}'),
                  ],
                ),
              ),
            ),

            // DOB
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Birthday: '),
                    Text('${contact.dateOfBirth}'),
                  ],
                ),
              ),
            ),

            // Gendre
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gendre: '),
                    Text('${contact.gender}'),
                  ],
                ),
              ),
            ),

            // Phone
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phone: '),
                    Text('${contact.phone}'),
                  ],
                ),
              ),
            ),

            // Email
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email: '),
                    Text('${contact.email}'),
                  ],
                ),
              ),
            ),

            // Address
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Address: '),
                    Text('${contact.address}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            GFButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              blockButton: true,
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              color: GFColors.ALT,
              shape: GFButtonShape.pills,
              child: Text(
                'Home',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
