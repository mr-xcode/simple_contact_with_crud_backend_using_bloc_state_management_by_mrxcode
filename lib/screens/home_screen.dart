import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/blocs/read/cubit/get_contact_cubit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/models/contact.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/screens/add_screen.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/screens/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myGlobalContext;
  @override
  Widget build(BuildContext context) {
    myGlobalContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
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
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) async {
                //await Navigator.of(context).push(MaterialPageRoute(
                //    builder: (_) => EditScreen(contact: contact)));
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
                    .deleteContact(contact.id ?? '0');
              },
              backgroundColor: GFColors.DANGER,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          title: Text('${contact.firstName} ${contact.lastName}'),
        ),
      ),
    );
  }
}
