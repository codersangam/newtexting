// ignore_for_file: prefer_const_constructors

import 'package:dating_app/authentications_bloc/cubits/signup_cubit.dart';
import 'package:dating_app/constatns/app_router.dart';
import 'package:dating_app/pages/tabs/mainpage.dart';
import 'package:dating_app/providers/userdata.dart';
import 'package:dating_app/respositories/bloc/image_bloc.dart';
import 'package:dating_app/respositories/bloc/swipebloc_bloc.dart';
import 'package:dating_app/respositories/databerepository.dart';
import 'package:dating_app/respositories/mainauth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/onboarding/onboardinng.dart';
import 'respositories/baseusers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<UserData>(create: (_) => UserData()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? status;
  void getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      status = prefs.getString('loggedIn');
    });
  }

  @override
  void initState() {
    super.initState();
    getLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignupCubit>(
            create: (_) =>
                SignupCubit(authRepository: context.read<AuthRepository>()),
            child: const OnboardingScreen(),
          ),
          BlocProvider(
            create: (_) => SwipeBloc(
              baseUsersRepo: Usersdata(),
            )..add(LoadedSwipe()),
          ),
          BlocProvider(
              create: (_) => ImageBloc(databaseRepository: DatabaseRepository())
                ..add(LoadImage())),
        ],
        child: MaterialApp(
          title: 'Discover',
          debugShowCheckedModeBanner: false,
          initialRoute: OnboardingScreen.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: ThemeData(
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              primaryColorLight: Colors.red, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.red)),
          home: OnboardingScreen(),
        ),
      ),
    );
  }
}

Future<auth.User> getcureentUser() async {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final auth.User user = _auth.currentUser!;
  return user;
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<auth.User>(
      future: getcureentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainPage();
        }
        return OnboardingScreen();
      },
    );
  }
}



