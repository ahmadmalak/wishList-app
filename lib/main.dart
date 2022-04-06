import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/ui/auth/login.dart';

import 'bloc/login_bloc.dart';
import 'bloc/wishlist_bloc.dart';
import 'core/routing/route_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsyncDataExampleHomePage();
  }
}

class AsyncDataExampleHomePage extends StatefulWidget {
  @override
  _AsyncDataExampleHomePageState createState() =>
      _AsyncDataExampleHomePageState();
}

class _AsyncDataExampleHomePageState extends State<AsyncDataExampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LoginBloc(),
          ),
          ChangeNotifierProvider(
            create: (_) => WishListBloc(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            home: LoginScreen(),
            initialRoute: loginScreenRoute),
      ),
    );
  }
}
