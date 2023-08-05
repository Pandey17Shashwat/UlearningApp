import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/Welcome/Bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/Welcome/Bloc/welcome_events.dart';
import 'package:ulearning_app/pages/Welcome/Bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 34.h),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                        print("index value is $index ");
                      },
                      children: [
                        _page(
                            1,
                            context,
                            'next',
                            'First See Learning',
                            'Forget about a for of paper all knowledge in on learning',
                            'assets/images/reading.png'),
                        _page(
                            2,
                            context,
                            'next',
                            'Connect With Everyone',
                            'Always keep in touch with your tutor & friend. Let\'s get connected!',
                            'assets/images/boy.png'),
                        _page(
                            3,
                            context,
                            'get started',
                            'Always fascinated learning',
                            'Anywhere, anytime. The time is at our discretion so study whenever you want',
                            'assets/images/man.png'),
                      ],
                    ),
                    Positioned(
                        bottom: 100.h,
                        child: DotsIndicator(
                          position: state.page,
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color: AppColors.primaryThirdElementText,
                              size: const Size.square(8.0),
                              activeColor:
                                  AppColors.primaryElement,
                              activeSize: const Size(18.0, 8.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ))
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route)=>false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
