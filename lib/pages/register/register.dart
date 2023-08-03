import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
// import 'package:ulearning_app/pages/sign_in/bloc/signin_event.dart';
// import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';
// import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
// import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:ulearning_app/pages/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Sign Up"),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
               height: 20.h,
            ),
            Center(child: reusableText("Enter your details below and free sign up")),
            Container(
              margin: EdgeInsets.only(top: 36.h),
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("User name"),
                    buildTextField("Enter your user name", "name", "user",
                        (value) {
                      // context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("email"),
                    buildTextField("Enter your email address", "email", "user",
                        (value) {
                      // context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("Password"),
                    buildTextField("Enter your password", "password", "lock",
                        (value) {
                      // context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                    reusableText("Re-enter your password"),
                    buildTextField("Re-enter your password to confirm", "password", "lock",
                        (value) {
                      // context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText("Enter your details below and free sign up")
                    ),
                    buildLoginAndRegButton('Sign Up', 'login', () {
                      Navigator.of(context).pushNamed("register");
                    })
                  ]),
            )
          ],
        )),
      )),
    );
  }
}
