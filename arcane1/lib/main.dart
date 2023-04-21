import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arcane1/core/http_certificate.dart';
import 'package:arcane1/feature/app/home/homepage.dart';
import 'package:arcane1/feature/app/routes/on-generate_route.dart';
import 'package:arcane1/feature/app/splash/splash_page.dart';
import 'package:arcane1/feature/chat_gpt/presentation/cubit/text_compl_cubit.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("==========STARTED===========");
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => di.sl<TextCompletionCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Arcane',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: '/',
        routes: {
          '/': (context) {
            return const SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
