import 'package:dating_app/authentications_bloc/cubits/signup_cubit.dart';
import 'package:dating_app/instances/login_status.dart';
import 'package:dating_app/pages/tabs/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final void function;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).focusColor,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (tabController.index != 5) {
            tabController.animateTo(tabController.index + 1);
          } else {
            context.read<SignupCubit>().updateLocation();
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => const MainPage()));
            Instances.saveLoginStatus('loggedIn');
          }

          if (tabController.index == 2) {
            context.read<SignupCubit>().signUpWithCredentials();
          }
          if (tabController.index == 3) {
            context.read<SignupCubit>().updateDatabase();
          }
          if (tabController.index == 5) {
            context.read<SignupCubit>().updateBio();
          }
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(text,
                style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }
}
