import 'package:arcane1/feature/app/app_constant/page_constant.dart';
import 'package:arcane1/feature/chat_gpt/presentation/pages/chat_screen.dart';
import 'package:flutter/material.dart';

import '../app_constant/colors.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        {
          return materialBuilder(
            widget: const ErrorPage(),
          );
        }

      case PageConstant.arcane1:
        {
          return materialBuilder(
            widget: const ChatScreen(),
          );
        }
      case PageConstant.arcane2:
        {
          return materialBuilder(
            widget:  Container(),
          );
        }

      default:
        return materialBuilder(
          widget: const ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatBackGround,
      appBar: AppBar(
        title: const Text(
          "Error",
        ),
        backgroundColor: botBackGrond,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Page Not Found",
        ),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
