import 'package:dating_app/authentications_bloc/cubits/signup_cubit.dart';
import 'package:dating_app/widgets/custom_textfield.dart';
import 'package:dating_app/widgets/custombtn.dart';
import 'package:dating_app/widgets/header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class Location extends StatelessWidget {
  final TabController tabController;

  const Location({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('STEP 5 OF 5',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 7),
                  const CustomTextHeader(text: 'Where Are You?'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    icon: Icons.location_on,
                    hint: 'E.g Nairobi, Kenya',
                    onChanged: (value) {
                      context.read<SignupCubit>().locatioChanged(value);
                      if (kDebugMode) {
                        print(state.age);
                      }
                    },
                    // controller: controller,
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 6,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Theme.of(context).dialogBackgroundColor,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(tabController: tabController, text: 'DONE'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
