import 'package:Contact_Plus/blocs/read/cubit/get_contact_cubit.dart';
import 'package:Contact_Plus/data/models/contact.dart';
import 'package:Contact_Plus/screens/add_screen.dart';
import 'package:Contact_Plus/screens/detailed_screen.dart';
import 'package:Contact_Plus/screens/edit_screen.dart';
import 'package:Contact_Plus/widgets/my_bottom_sheet.dart';
import 'package:Contact_Plus/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var myGlobalContext;
  final GFBottomSheetController _controller = GFBottomSheetController();
  @override
  Widget build(BuildContext context) {
    myGlobalContext = context;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Contact Plus',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _controller.isBottomSheetOpened
                  ? _controller.hideBottomSheet()
                  : _controller.showBottomSheet();
            },
            iconSize: GFSize.MEDIUM,
            tooltip: 'About App',
            icon: const Icon(Icons.info_outline_rounded),
          ),
          const SizedBox(
            width: 9,
          ),
        ],
        backgroundColor: Colors.deepPurple[400],
      ),
      drawer: const MyDrawer(),
      bottomSheet: MyBottomSheet(controller: _controller),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddScreen()));

          if (result != null && result == 'success') {
            // ignore: use_build_context_synchronously
            BlocProvider.of<GetContactCubit>(context).getContact();
          }
        },
        tooltip: 'Create New Contact',
        label: Text(
          'Contact',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: GFColors.ALT,
      ),
      body: BlocBuilder<GetContactCubit, GetContactState>(
        builder: (context, state) {
          if (state is GetContactSuccess) {
            List<Contact> contacts = state.contacts;
            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return singleItem(contacts[index]);
                });
          } else if (state is GetContactFail) {
            return Center(
              child: Text(
                'May be there is no Internet, try again later!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: GFColors.DANGER,
                ),
              ),
            );
          }
          return const Center(
            child: GFLoader(),
          );
        },
      ),
    );
  }

  Widget singleItem(Contact contact) {
    return Card(
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context) async {
                var result = await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EditScreen(contact: contact)),
                    (route) => route.isFirst);
                if (result != null && result == 'success') {
                  BlocProvider.of<GetContactCubit>(myGlobalContext)
                      .getContact();
                }
              },
              backgroundColor: GFColors.PRIMARY,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                BlocProvider.of<GetContactCubit>(context)
                    .deleteContact(contact.id);
              },
              backgroundColor: GFColors.DANGER,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DetailedScreen(
                      contact: contact,
                    )));
          },
          child: ListTile(
            title: Text(
              '${contact.firstName} ${contact.lastName}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: SizedBox(
              width: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.phone_android_outlined,
                    color: GFColors.ALT,
                  ),
                  Text(
                    '${contact.phone}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: GFColors.FOCUS,
                    ),
                  ),
                ],
              ),
            ),
            leading: Icon(
              (contact.gender == 'Male')
                  ? Icons.boy_rounded
                  : (contact.gender == 'Female')
                      ? Icons.girl_rounded
                      : Icons.question_mark_sharp,
              size: 33,
            ),
          ),
        ),
      ),
    );
  }
}
