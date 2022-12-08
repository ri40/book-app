import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/prodect_controller.dart';
import '../popupMenu/popup_menu.dart';

class ProuctsInStock extends StatelessWidget {
  List<dynamic> prodect;
  ProuctsInStock({super.key, required this.prodect});
  final controller = Get.find<ProdectController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prodect.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 5),
            height: 138,
            width: 393,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  height: 106,
                  width: 96,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: NetworkImage('${prodect[index].imageUrl}'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "${prodect[index].productNumber}",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            PopupMenu(
                              prodectId: '${prodect[index].productNumber}',
                              productName: '${prodect[index].productName}',
                              category: '${prodect[index].category}',
                              quantity: '${prodect[index].quantity}',
                              price: '${prodect[index].price}',
                              description: '${prodect[index].description}',
                              imageUrl: '${prodect[index].imageUrl}',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${prodect[index].productName}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${prodect[index].category}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${prodect[index].quantity}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(children: [
                        Text("\$${prodect[index].price}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        Spacer(),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeTrackColor: Color.fromRGBO(67, 24, 255, 1),
                          activeColor: Colors.white,
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
