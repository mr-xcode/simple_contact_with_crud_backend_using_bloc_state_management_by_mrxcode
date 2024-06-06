import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GFDrawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const GFDrawerHeader(
                currentAccountPicture: GFAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/150790730?s=400&u=1d8b8baf9ea065e462d37376fbb3b9c0cd3e9c2d&v=4"),
                ),
                otherAccountsPictures: <Widget>[
                  Image(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                    fit: BoxFit.cover,
                  ),
                  GFAvatar(
                    child: Text("ab"),
                  )
                ],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      'Mr Xcode',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'mrxcode@tech4mm.com',
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Notifications'),
                leading: const Icon(Icons.notifications_outlined),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Reviews'),
                leading: const Icon(Icons.reviews_outlined),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Payments'),
                leading: const Icon(Icons.payment_outlined),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings_outlined),
                onTap: () {},
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 10,
          child: GFButton(
            shape: GFButtonShape.pills,
            color: GFColors.ALT,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            child: const Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
