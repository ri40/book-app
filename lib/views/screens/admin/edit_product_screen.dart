import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../logic/controllers/prodect_controller.dart';
import '../../widgets/admin/Add_Product_Widgets/text_field_product.dart';
import '../../widgets/admin/Add_Product_Widgets/text_utils.dart';

class EditProductScreen extends StatelessWidget {
  TextEditingController test = TextEditingController();
  String prodectId;
  String productName;
  String category;
  String quantity;
  String price;
  String description;
  String imageUrl;
  EditProductScreen(
      {Key? key,
      required this.prodectId,
      required this.productName,
      required this.category,
      required this.quantity,
      required this.price,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  final controller = Get.find<ProdectController>();
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            controller.clearController();
            Get.back();
          },
          child: Text("Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        title: Text(
          "Edit product",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // titleSpacing: 50,
        centerTitle: true,

        actions: [
          GetBuilder<ProdectController>(builder: (_) {
            return TextButton(
              onPressed: () {
                controller.updateProduct(
                    prodectId,
                    controller.productNameControlller,
                    controller.productCategoryController,
                    controller.productQuantityController,
                    controller.productPriceController,
                    controller.productDescriptionController,
                    controller.imgUrl);
                controller.clearController();
              },
              child: Text(
                "Edit",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            );
          })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Product Name',
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productNameControlller,
                  obscureText: false,
                  hintText: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Name Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Category',
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productCategoryController,
                  obscureText: false,
                  hintText: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Category Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Quantity',
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productQuantityController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  hintText: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Quantity Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Price',
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productPriceController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  hintText: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Price Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Description',
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 76,
                  width: 361,
                  controller: controller.productDescriptionController,
                  obscureText: false,
                  hintText: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Description Please';
                    }
                  },
                  maxLength: 100,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.TakePhoto(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(217, 217, 217, 1),
                      padding: EdgeInsets.all(16),
                      minimumSize: Size(1, 6)),
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Edit Image",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
