import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../utils/text_utils.dart';
import '../../utils/theme.dart';
import '../widgets/auth/icon_widget.dart';
import '../widgets/auth/signUp_email_form.dart';
import '../widgets/auth/signUp_phone_number_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 90, bottom: 363, right: 40, left: 50),
          child: Column(
            children: [
              TextUtils(
                  text: 'Sign Up by',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 3.7.h,
              ),
              Row(
                children: [
                  GetBuilder<AuthController>(builder: (_) {
                    return IconWidget(
                      conternierColor: googleColor,
                      onPressed: () async {
                        await controller.loginUsinggoogle();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );

                      },
                      textUtils: 'with Google',
                      image: 'assets/images/image 14google.png',
                    );
                  }),
                  SizedBox(
                    width: 4.w,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return IconWidget(
                        conternierColor: Colors.black,
                        onPressed: () {},
                        textUtils: 'with Apple',
                        image: 'assets/images/image 14google.png',
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 6.3.h,
              ),
              TextUtils(
                  text: 'or',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 2.3.h,
              ),
              Container(
                height: 40,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: mainColor,
                  tabs: [
                    Tab(
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Phone number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 650,
                child:
                    TabBarView(controller: controller.tabController, children: [
                  SignUp_Email_Form(),
                  SignUp_Phone_Number_Form(),
                ]),
              )
            ],
          ), // end page
        ),
      ),
    );
  }
}
