import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Pages {
  home('/'),
  login('/login');

  const Pages(this.route);
  final String route;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Pages currentPage = Pages.home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
          pages: [
            if (currentPage == Pages.home)
              MaterialPage(child: MyHomePage(
                changeRoute: ((value) {
                  setState(() {
                    currentPage = value;
                  });
                }),
              )),
            if (currentPage == Pages.login)
              MaterialPage(child: LoginScreen(
                changeRoute: ((value) {
                  setState(() {
                    currentPage = value;
                  });
                }),
              )),
          ],
          onPopPage: (route, result) {
            if (route.didPop(result)) return false;

            return true;
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.changeRoute, Key? key}) : super(key: key);
  final ValueChanged<Pages> changeRoute;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('My Homepage'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              widget.changeRoute(Pages.login);
            },
            child: const Text('Switch Page'),
          )
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({required this.changeRoute, Key? key}) : super(key: key);
  final ValueChanged<Pages> changeRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            changeRoute(Pages.home);
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Login Page'),
            ],
          )
        ],
      ),
    );
  }
}
