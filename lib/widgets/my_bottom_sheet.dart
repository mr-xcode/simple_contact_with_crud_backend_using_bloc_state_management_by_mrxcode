import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    super.key,
    required GFBottomSheetController controller,
  }) : _controller = controller;

  final GFBottomSheetController _controller;

  @override
  Widget build(BuildContext context) {
    return GFBottomSheet(
      controller: _controller,
      maxContentHeight: 123,
      contentBody: Container(
        height: 99,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: const [
            SizedBox(
              height: 19,
            ),
            Center(
                child: Text(
              'A simple flutter contact application with backend crudcurd.com. flutter_bloc is used for State Management.',
              style:
                  TextStyle(fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
            ))
          ],
        ),
      ),
      stickyFooter: Container(
        color: GFColors.ALT,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.phone_android_outlined,
              color: Colors.white,
            ),
            Text(
              '09 777 56 22 56',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      stickyFooterHeight: 50,
    );
  }
}
