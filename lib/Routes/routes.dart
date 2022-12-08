import 'package:book_app/logic/bindings/nav_bar_binding.dart';
import 'package:book_app/logic/bindings/product_binding.dart';
import 'package:book_app/views/Screens/admin/stock_screen.dart';
import 'package:book_app/views/screens/admin/Add_product_form_screen.dart';
import 'package:book_app/views/screens/forgot_password_screen.dart';
import 'package:book_app/views/screens/login_screen.dart';
import 'package:book_app/views/screens/setting/edit_profile_screen.dart';
import 'package:book_app/views/screens/setting/profile.dart';
import 'package:book_app/views/screens/setting/settings_screen.dart';
import 'package:book_app/views/screens/signup_screen.dart';
import 'package:book_app/views/screens/user/customer_home.dart';
import 'package:book_app/views/widgets/nav_bar_widget.dart';
import 'package:book_app/views/widgets/settings/logout.dart';
import 'package:get/route_manager.dart';

import '../logic/bindings/auth_binding.dart';

class AppRoutes {
  static const login = Routes.loginScreen;

  static const stock = Routes.stockScreen;
  static const addProduct = Routes.loginScreen;
  static const customerHome = Routes.customerHome;

  static final routes = [
    GetPage(
        name: Routes.navBarScreen,
        page: () => NavBarScreen(),
        binding: NavBarBinding()),
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotpasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.profileScreen,
        page: () => ProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.editProfileScreen,
        page: () => EditProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.settingsScreen,
        page: () => SettingScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.stockScreen,
        page: () => StockScreen(),
        binding: ProductBinding()),
    GetPage(
        name: Routes.addProductForm,
        page: () => AddProductFromScreen(),
        binding: ProductBinding()),
    GetPage(
        name: Routes.customerHome,
        page: () => CustomerHome(),
        binding: ProductBinding()),

    GetPage(
        name: Routes.logoutScreen,
        page: () => LogOut(),
        binding: AuthBinding()),
  ];
}

class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgotpasswordScreen = '/forgotpasswordScreen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const settingsScreen = '/settingsScreen';
  static const stockScreen = '/StockScreen';
  static const addProductForm = '/AddProductFromScreen';
  static const editProduct = '/EditProductScreen';
  static const customerHome = '/CustomerHome';
  static const navBarScreen = '/NavBarScreen';
  static const logoutScreen = '/logoutScreen';

}
