import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Model/product.dart';
import '../../Routes/routes.dart';
import '../../views/Screens/admin/stock_screen.dart';

class ProdectController extends GetxController {
  late TextEditingController productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController;

  File? pickedFile;
  String imgUrl = "";
  final imagePicker = ImagePicker();

  final getData = FirebaseFirestore.instance.collection('prodects').snapshots();

  List<dynamic> prodects = [];

  //update varible
  var productName = ''.obs;
  var productCategory = ''.obs;
  var productQuantity = ''.obs;
  var productPrice = ''.obs;
  var productDescription = ''.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    productNumberController = TextEditingController();
    productNameControlller = TextEditingController();
    productCategoryController = TextEditingController();
    productQuantityController = TextEditingController();
    productPriceController = TextEditingController();
    productDescriptionController = TextEditingController();
  }

  // add to firebase

  Future<void> addProdect(Prodect prodect) async {
    if (pickedFile == null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }
    // we nede Refrence to firebase
    final prodectRef = FirebaseFirestore.instance.collection('prodects').doc();
    prodect.productNumber = prodectRef.id;
    prodect.imageUrl = imgUrl.toString();
    final data = prodect.toJson(); // insert to fiserbase
    prodectRef.set(data).whenComplete(() {
      clearController();
      Get.snackbar("", "Added successfully..");
      Get.to(StockScreen());
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });
  }

  Future<void> TakePhoto(ImageSource sourse) async {
    final pickedImage =
        await imagePicker.pickImage(source: sourse, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    print("..............");
    print(pickedFile);
    print("..............");
  }

  // update on firebase

  Future<void> updateProduct(
      productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController,
      imgUrl) async {
    productName.value = productNameControlller.text;
    productCategory.value = productCategoryController.text;
    productQuantity.value = productQuantityController.text;
    productPrice.value = productPriceController.text;
    productDescription.value = productDescriptionController.text;
    imgUrl;

    final ref = FirebaseStorage.instance
        .ref()
        .child("productImage")
        .child(productNameControlller.text + ".jpg");
    if (pickedFile == null) {
    } else {
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }

    final docProduct = FirebaseFirestore.instance
        .collection("prodects")
        .doc(productNumberController);
    docProduct.update({
      "productName": productName.value,
      "category": productCategory.value,
      "quantity": int.parse(productQuantity.value),
      "price": double.parse(productPrice.value),
      "description": productDescription.value,
      "imageUrl": imgUrl.toString(),
    }).whenComplete(() {
      print("update done");
      Get.snackbar("", "Update successfully..");
      clearController();
      update();
      Get.toNamed(Routes.stockScreen);
    });
  }

  // delete on firebase
  Future<void> deleteData(
      productNumberController, productNameControlller) async {
    await FirebaseFirestore.instance
        .collection('prodects')
        .doc(productNumberController)
        .delete()
        .whenComplete(() async {
      Get.snackbar("", "Delete successfully..");
      print("delete ${productNumberController}");

      FirebaseStorage.instance
          .ref()
          .child("productImage/")
          .child(productNameControlller + ".jpg")
          .delete()
          .whenComplete(() => print("image delete"));
    });
  }

  // clear Controller
  void clearController() {
    productNameControlller.clear();
    productCategoryController.clear();
    productQuantityController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
    pickedFile = null;
  }

  List<dynamic> favouritesList = [].obs;
  List<dynamic> prodectsFavourites = [];

  void manageFavourites(String id) {
    print('First isFav ${isFave(id)}');
    for (var i = 0; i < prodects.length; i++) {
      var fromj = prodectToJson(prodects[i]);
      var x = prodectFromJson(fromj);
      var y = x.toJson();
      if (y['productNumber'] == id && isFave(id) == false) {
        favouritesList.add(y);
        print("added!!!");
      }
    }
    print('Seconed isFav ${isFave(id)}');
  }

  bool isFave(String productId) {
    return favouritesList
        .any((element) => element['productNumber'] == productId);
  }
}
