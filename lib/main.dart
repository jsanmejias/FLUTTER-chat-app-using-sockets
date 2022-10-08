import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/colors.dart';
import 'package:chat_app/view/helpers/create_material_color.dart';

import 'package:chat_app/view/pages/loading/loading_page.dart';

import 'package:chat_app/config/routes/app_pages.dart';

import 'view/pages/loading/loading_binding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(backActionColor),
        fontFamily: 'Poppins',
        textSelectionTheme: const TextSelectionThemeData(cursorColor: backActionColor, selectionColor: backActionColor)
      ),
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      //const LoadingPage()
      //const Splash()
      home: const LoadingPage(),
      initialBinding: LoadingBinding(),
      getPages: AppPages.pages,
    );
  }
}
