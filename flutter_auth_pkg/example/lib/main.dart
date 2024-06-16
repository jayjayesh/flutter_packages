import 'package:flutter/material.dart';
import 'package:flutter_auth_pkg/flutter_auth_pkg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() {
  flutterAuthPkgController = FlutterAuthPkgController();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashPageAuthPkg(),
        ),
        GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/signupPage',
          page: () => const SignupPage(),
        ),
        GetPage(
          name: '/profilePage',
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: '/myHomePage',
          page: () => const MyHomePage(title: 'Home Page'),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Text('My Profile'), //const Icon(Icons.person),
            onPressed: () {
              Get.toNamed('/profilePage');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home Page',
            ),
            const Text(
              'You are Sign in successfully.',
            ),
            Text(
              'User Name: ${flutterAuthPkgController.currentUser?.name}',
            ),
          ],
        ),
      ),
    );
  }
}
