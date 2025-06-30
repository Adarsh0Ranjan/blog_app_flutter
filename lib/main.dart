import 'package:blog_app_flutter/Core/Theme/theme.dart';
import 'package:blog_app_flutter/Features/Auth/Presentation/Bloc/auth_bloc.dart';
import 'package:blog_app_flutter/Features/Auth/Presentation/Pages/login_page.dart';
import 'package:blog_app_flutter/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => serviceLocator<AuthBloc>()
      )
    ],
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}


