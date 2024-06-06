import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/blocs/read/cubit/get_contact_cubit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/data/models/contact.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/screens/add_screen.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/screens/detailed_screen.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/screens/edit_screen.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/widgets/my_bottom_sheet.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myGlobalContext;
  final GFBottomSheetController _controller = GFBottomSheetController();
  @override
  Widget build(BuildContext context) {
    myGlobalContext = context;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Contact',
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
            icon: Icon(Icons.info_outline_rounded),
          ),
          SizedBox(
            width: 9,
          ),
        ],
        backgroundColor: Colors.deepPurple[400],
      ),
      drawer: MyDrawer(),
      bottomSheet: MyBottomSheet(controller: _controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddScreen()));

          if (result != null && result == 'success') {
            BlocProvider.of<GetContactCubit>(context).getContact();
          }
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<GetContactCubit, GetContactState>(
        builder: (context, state) {
          if (state is GetContactSuccess) {
            List<Contact> contacts = state.contacts;
            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return SingleItem(contacts[index]);
                });
          } else if (state is GetContactFail) {
            return Center(
              child: Text(state.error),
            );
          }
          return Center(
            child: GFLoader(),
          );
        },
      ),
    );
  }

  Widget SingleItem(Contact contact) {
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
            print('pressed');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DetailedScreen(
                      contact: contact,
                    )));
          },
          child: ListTile(
            title: Text(
              '${contact.firstName} ${contact.lastName}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.phone_android_outlined),
                  Text('${contact.phone}'),
                ],
              ),
            ),
            leading: Icon(
              (contact.gender == 'Male' || contact.gender == 'male')
                  ? Icons.boy_rounded
                  : Icons.girl_rounded,
              size: 33,
            ),
          ),
        ),
      ),
    );
  }
}
