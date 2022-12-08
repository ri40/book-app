import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/prodect_controller.dart';

class SearchProducts extends StatelessWidget {
  SearchProducts({Key? key}) : super(key: key);

  final controller = Get.put(ProdectController());

  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdectController>(
        builder: (_) => TextField(
              controller: searchTextController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              onChanged: (searchName) {
                //controller.addSearchToList(searchName);
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.red,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Search Product",
                hintStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ));
  }
}
