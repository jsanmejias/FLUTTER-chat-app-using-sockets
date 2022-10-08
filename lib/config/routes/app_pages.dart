import 'package:chat_app/view/pages/logged_user_profile/logged_user_profile_page.dart';
import 'package:get/get.dart';
import 'package:chat_app/config/routes/app_routes.dart';
import 'package:chat_app/view/pages/chat/chat_page.dart';
import 'package:chat_app/view/pages/chat/chat_binding.dart';
import 'package:chat_app/view/pages/user_to_profile/user_to_profile_page.dart';
import 'package:chat_app/view/pages/loading/loading_page.dart';
import 'package:chat_app/view/pages/loading/loading_binding.dart';
import 'package:chat_app/view/pages/login/login_page.dart';
import 'package:chat_app/view/pages/login/login_binding.dart';
import 'package:chat_app/view/pages/register/register_page.dart';
import 'package:chat_app/view/pages/register/register_binding.dart';
import 'package:chat_app/view/pages/users/users_page.dart';
import 'package:chat_app/view/pages/users/users_binding.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.loading,
      page: () => const LoadingPage(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UsersPage(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.userToProfile,
      page: () => const UserToProfile(),
    ),
    GetPage(
      name: AppRoutes.loggedUserProfile,
      page: () => const LoggedUserProfilePage(),
    ),
  ];
}
