import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'Routes/routes.dart';
import 'firebase_options.dart';
import 'logic/bindings/auth_binding.dart';
import 'logic/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Ubuntu'),

          initialRoute: FirebaseAuth.instance.currentUser != null ||
                  GetStorage().read<bool>("auth") == true
              ? authController.displayUserEmail.value == 'admin@gmail.com'
                  ? Routes.stockScreen
                  : Routes.navBarScreen
              : AppRoutes.login,

          //  initialRoute: Routes.loginScreen,

          getPages: AppRoutes.routes,
          initialBinding: AuthBinding(),
        );
      },
    );
  }
}
