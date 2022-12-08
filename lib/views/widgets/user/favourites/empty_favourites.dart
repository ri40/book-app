import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Routes/routes.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.playlist_remove_outlined,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(
            height: 18,
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            child: Text('Your Wish list is empty'),
          ),
          SizedBox(
            height: 22,
          ),
          SizedBox(
              height: 41,
              width: 197,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 0,
                  primary: Colors.grey.shade300,
                ),
                onPressed: () {
                  Get.toNamed(Routes.customerHome);
                },
                child: Text(
                  "View Items ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
