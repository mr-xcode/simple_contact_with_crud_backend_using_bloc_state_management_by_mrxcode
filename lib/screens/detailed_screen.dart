// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:Contact_Plus/data/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedScreen extends StatelessWidget {
  final Contact contact;
  // ignore: use_super_parameters
  const DetailedScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              _handleShareButton(context);
            },
            icon: const Icon(Icons.share_rounded),
          ),
          const SizedBox(
            width: 9,
          ),
        ],
        title: Text(
          '${contact.firstName} ${contact.lastName}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Container(
        padding: const EdgeInsets.all(9),
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
                    const Text('Name: '),
                    Text('${contact.firstName}  ${contact.lastName}'),
                  ],
                ),
              ),
            ),

            // Nick Name
            Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nick Name: '),
                    Text(contact.nickName),
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
                    const Text('Birthday: '),
                    Text(
                      contact.dateOfBirth.substring(0, 10),
                    ),
                  ],
                ),
              ),
            ),

            // Gendre
            Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Gendre: '),
                    Text(contact.gender),
                  ],
                ),
              ),
            ),

            // Phone
            GestureDetector(
              onTap: () {
                print('Phone call');
                _makeCall('${contact.phone}');
              },
              child: Card(
                elevation: 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Phone: '),
                      Text(contact.phone),
                    ],
                  ),
                ),
              ),
            ),

            // Email
            Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Email: '),
                    Text(contact.email),
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
                    const Text('Address: '),
                    Text(contact.address),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            GFButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              size: GFSize.LARGE,
              blockButton: true,
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              color: GFColors.ALT,
              shape: GFButtonShape.pills,
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makeCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _handleShareButton(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid) {
      _showShareOptions(context);
    } else {
      // Do nothing or show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Share functionality is not available on this platform.'),
        ),
      );
    }
  }

  void _showShareOptions(BuildContext context) {
    Share.share(
        'Check out this app: https://github.com/mr-xcode/simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode',
        subject: 'Check out this cool contact app',
        sharePositionOrigin: Rect.fromLTWH(
            MediaQuery.of(context).size.width / 2 - 100,
            MediaQuery.of(context).size.height / 2 - 100,
            200,
            200));
  }
}
